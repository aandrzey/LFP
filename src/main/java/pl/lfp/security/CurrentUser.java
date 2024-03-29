package pl.lfp.security;


import lombok.Getter;
import lombok.Setter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import java.util.Collection;

@Getter
@Setter
public class CurrentUser extends User {

    private final pl.lfp.domain.User user;

    public CurrentUser(String username, String password, Collection<? extends GrantedAuthority> authorities,
                       pl.lfp.domain.User user) {
        super(username, password, authorities);
        this.user = user;
    }
    public pl.lfp.domain.User getUser() {return user;}
}
