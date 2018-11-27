package models.hexakomb.taxi.api.domain;


import io.ebean.Model;
import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "LOCATION")
public class Location extends Model{

    @Id
    @Column(name = "ID")
    public long id;

    @NotNull
    @NotBlank
    @Column(name = "NAME", nullable = false)
    public String name;

}
