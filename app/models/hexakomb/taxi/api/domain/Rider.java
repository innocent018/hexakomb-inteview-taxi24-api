package models.hexakomb.taxi.api.domain;

import io.ebean.Model;
import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.time.LocalDate;

@Entity
@Table(name = "RIDER")
public class Rider extends Model {

    @Id
    @Column(name = "ID")
    public long id;

    @NotBlank
    @NotNull
    @Column(name ="NAMES", nullable = false)
    public String names;

    @NotNull
    @Column(name = "GENDER", nullable = false)
    @Enumerated(EnumType.STRING)
    public EGender gender;


    @Column(name = "DATE_OF_BIRTH")
    public LocalDate dateOfBirth;


    @Column(name = "LOCATION_ID", nullable = false)
    @ManyToOne(cascade = CascadeType.ALL)
    public Location location;

}
