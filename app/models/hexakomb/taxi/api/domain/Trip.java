package models.hexakomb.taxi.api.domain;


import io.ebean.Model;

import javax.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "trip")
public class Trip extends Model{

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy=GenerationType.AUTO)
    public long id;

    @Column(name = "trip_date")
    public LocalDate tripDate;

    @Column(name = "location_id", nullable = false)
    @ManyToOne(cascade = CascadeType.ALL)
    public Location location;

    @Column(name = "driver_id", nullable = false)
    @ManyToOne(cascade = CascadeType.ALL)
    public Driver driver;

    @Column(name = "rider_id", nullable = false)
    @ManyToOne(cascade = CascadeType.ALL)
    public Rider rider;

    @Column(name = "status", nullable = false)
    @Enumerated(EnumType.STRING)
    public ETripStatus status;
}
