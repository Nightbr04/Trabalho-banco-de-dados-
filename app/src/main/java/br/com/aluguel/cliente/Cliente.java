package br.com.aluguel.cliente;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;

import java.time.LocalDateTime;

@Entity
@Table(name = "clientes")
public class Cliente {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @NotBlank(message = "Informe o nome.")
    @Size(max = 150, message = "O nome deve ter no máximo 150 caracteres.")
    @Column(nullable = false, length = 150)
    private String nome;

    @NotBlank(message = "Informe o CPF.")
    @Pattern(regexp = "\\d{11}", message = "O CPF deve ter exatamente 11 dígitos (somente números).")
    @Column(nullable = false, length = 11, unique = true)
    private String cpf;

    @NotBlank(message = "Informe o WhatsApp.")
    @Size(max = 20, message = "O WhatsApp deve ter no máximo 20 caracteres.")
    @Column(nullable = false, length = 20)
    private String whatsapp;

    @Size(max = 200, message = "O endereço deve ter no máximo 200 caracteres.")
    @Column(length = 200)
    private String endereco;

    // Preenchido pelo DEFAULT GETDATE() do banco; a aplicacao nunca grava este campo.
    @Column(name = "criado_em", insertable = false, updatable = false)
    private LocalDateTime criadoEm;

    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }

    public String getNome() { return nome; }
    public void setNome(String nome) { this.nome = nome; }

    public String getCpf() { return cpf; }
    public void setCpf(String cpf) { this.cpf = cpf; }

    public String getWhatsapp() { return whatsapp; }
    public void setWhatsapp(String whatsapp) { this.whatsapp = whatsapp; }

    public String getEndereco() { return endereco; }
    public void setEndereco(String endereco) { this.endereco = endereco; }

    public LocalDateTime getCriadoEm() { return criadoEm; }
}
