package models.hexakomb.taxi.api.domain;


import io.ebean.Model;

import javax.persistence.*;

@Entity
@Table(name = "LOCATION_DISTANCE")
public class LocationDistance extends Model {

    @Id
    @Column(name = "ID")
    public long id;

    @ManyToOne(cascade = CascadeType.ALL)
    @Column(name = "LOCATION_A", nullable = false)
    public Location locationA;

    @ManyToOne(cascade = CascadeType.ALL)
    @Column(name = "LOCATION_B", nullable = false)
    public Location locationB;

    @Column(name = "DISTANCE")
    public double distance;

}
