package pl.lfp.domain.dto;

import lombok.Getter;
import lombok.Setter;
import pl.lfp.domain.Post;
import pl.lfp.domain.User;

import javax.validation.constraints.Size;

@Getter
@Setter
public class CommentDto {

    @Size(min = 2, max = 300)
    private String content;

    private User user;

    private Post post;
}
