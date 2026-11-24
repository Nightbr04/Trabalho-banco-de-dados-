package br.com.aluguel.cliente;

import jakarta.validation.Valid;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/clientes")
public class ClienteController {

    private final ClienteRepository repository;

    public ClienteController(ClienteRepository repository) {
        this.repository = repository;
    }

    @GetMapping
    public String listar(@RequestParam(required = false) String busca, Model model) {
        if (busca == null || busca.isBlank()) {
            model.addAttribute("clientes", repository.findAllByOrderByNome());
        } else {
            String termo = busca.trim();
            model.addAttribute("clientes",
                    repository.findByNomeContainingIgnoreCaseOrCpfContainingOrderByNome(termo, termo));
            model.addAttribute("busca", termo);
        }
        return "clientes/lista";
    }

    @GetMapping("/novo")
    public String novo(Model model) {
        model.addAttribute("cliente", new Cliente());
        return "clientes/form";
    }

    @GetMapping("/{id}/editar")
    public String editar(@PathVariable Integer id, Model model, RedirectAttributes flash) {
        return repository.findById(id)
                .map(c -> {
                    model.addAttribute("cliente", c);
                    return "clientes/form";
                })
                .orElseGet(() -> {
                    flash.addFlashAttribute("erro", "Cliente não encontrado.");
                    return "redirect:/clientes";
                });
    }

    @PostMapping
    public String criar(@Valid @ModelAttribute Cliente cliente, BindingResult result, RedirectAttributes flash) {
        if (!result.hasFieldErrors("cpf") && repository.existsByCpf(cliente.getCpf())) {
            result.rejectValue("cpf", "duplicado", "Já existe um cliente com este CPF.");
        }
        if (result.hasErrors()) {
            return "clientes/form";
        }
        cliente.setId(null);
        repository.save(cliente);
        flash.addFlashAttribute("sucesso", "Cliente cadastrado com sucesso.");
        return "redirect:/clientes";
    }

    @PostMapping("/{id}")
    public String atualizar(@PathVariable Integer id, @Valid @ModelAttribute Cliente cliente,
                            BindingResult result, RedirectAttributes flash) {
        if (!repository.existsById(id)) {
            flash.addFlashAttribute("erro", "Cliente não encontrado.");
            return "redirect:/clientes";
        }
        if (!result.hasFieldErrors("cpf") && repository.existsByCpfAndIdNot(cliente.getCpf(), id)) {
            result.rejectValue("cpf", "duplicado", "Já existe outro cliente com este CPF.");
        }
        if (result.hasErrors()) {
            return "clientes/form";
        }
        cliente.setId(id);
        repository.save(cliente);
        flash.addFlashAttribute("sucesso", "Cliente atualizado com sucesso.");
        return "redirect:/clientes";
    }

    @PostMapping("/{id}/excluir")
    public String excluir(@PathVariable Integer id, RedirectAttributes flash) {
        try {
            if (!repository.existsById(id)) {
                flash.addFlashAttribute("erro", "Cliente não encontrado.");
            } else {
                repository.deleteById(id);
                repository.flush();
                flash.addFlashAttribute("sucesso", "Cliente excluído com sucesso.");
            }
        } catch (DataIntegrityViolationException e) {
            flash.addFlashAttribute("erro",
                    "Não é possível excluir: o cliente possui atendimentos ou contratos vinculados.");
        }
        return "redirect:/clientes";
    }
}
