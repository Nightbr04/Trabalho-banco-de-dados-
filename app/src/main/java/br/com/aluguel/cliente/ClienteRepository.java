package br.com.aluguel.cliente;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ClienteRepository extends JpaRepository<Cliente, Integer> {

    boolean existsByCpf(String cpf);

    boolean existsByCpfAndIdNot(String cpf, Integer id);

    List<Cliente> findByNomeContainingIgnoreCaseOrCpfContainingOrderByNome(String nome, String cpf);

    List<Cliente> findAllByOrderByNome();
}
