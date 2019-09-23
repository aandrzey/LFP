package pl.lfp.domain;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "users")
@Getter
@Setter
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank
    @Size(min = 2, max = 20)
    @Column(unique = true)
    private String username;

    //todo zmienić validację na emailu
    @NotBlank
    @Email
    @Column(unique = true)
    private String email;

    //todo ustawić walidację na password
    @NotBlank
    private  String password;

    @OneToMany(mappedBy = "user")
    private List<Post> posts;

    private int enabled;

    @ManyToMany(fetch = FetchType.EAGER)
    private Set<Role> roles;


}
