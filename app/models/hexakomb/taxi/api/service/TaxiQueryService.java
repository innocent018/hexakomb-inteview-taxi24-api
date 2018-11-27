package models.hexakomb.taxi.api.service;

import io.ebean.Finder;
import models.hexakomb.taxi.api.domain.*;
import play.Logger;

import javax.validation.constraints.NotNull;
import java.util.LinkedList;
import java.util.List;


/**
 * The type Taxi query service.
 */
public class TaxiQueryService implements ITaxiQueryService{

    private Finder<Long, Driver> driverFinder = new Finder<>(Driver.class);
    private Finder<Long, Trip> tripFinder = new Finder<>(Trip.class);
    private Finder<Long, Rider> riderFinder = new Finder<>(Rider.class);
    private Finder<Long, Location> locationFinder = new Finder<>(Location.class);
    private Finder<Long, LocationDistance> locationDistanceFinder = new Finder<>(LocationDistance.class);

    @Override
    public List<Driver> getAllDrivers() {
        return driverFinder.all();
    }

    @Override
    public List<Driver> getAllAvailableDriver(@NotNull final EDriverAvailability availability) {
        return driverFinder.db().find(Driver.class).where()
                .eq("availability", availability)
                .findList();
    }

    @Override
    public List<Driver> getAllAvailableDriverWithin3Km(@NotNull final EDriverAvailability availability, @NotNull final Location location) {
        List<Driver> drivers = findAvailableDriversByLocation(location);
        try {
            if(drivers == null){
                drivers = new LinkedList<>();
            }
            List<LocationDistance> locationDistances = findLocationDistancesByLocation(location);
            for (LocationDistance distance : locationDistances) {
                if (distance.distance <= 3) {
                    List<Driver> driversObj = findAvailableDriversByLocation(distance.locationB);
                    drivers.addAll(driversObj);
                }
            }
        }catch (Exception ex){
            Logger.info(ex.getMessage());
        }
        return drivers;
    }

    @Override
    public Driver getDriverById(@NotNull final  long id) {
        return driverFinder.byId(id);
    }

    @Override
    public List<Trip> getAllActiveTrips(@NotNull final ETripStatus status) {
        return tripFinder.db().find(Trip.class).where()
                .eq("status", status)
                .findList();
    }

    @Override
    public List<Rider> getAllRiders() {
        return riderFinder.all();
    }

    @Override
    public Rider getRiderById(@NotNull final long id) {
        return riderFinder.byId(id);
    }

    @Override
    public List<Driver> getClosestDrivers(@NotNull final Rider rider) {
        List<Driver> drivers = findAvailableDriversByLocation(rider.location);
        try {
            if(drivers == null){
                drivers = new LinkedList<>();
            }
            List<LocationDistance> locationDistances = locationDistanceFinder.all();
            if(drivers.size() < 3) {
                for(int i = drivers.size(); i <=3 ; i++) {

                    if(i == 3){
                        break;
                    }
                }
            }
        }catch (Exception ex){
            Logger.info(ex.getMessage());
        }
        return drivers;
    }

    @Override
    public Location findLocationByName(@NotNull final  String name) {
        return locationFinder.db().find(Location.class).where()
                .eq("name", name)
                .findUnique();
    }

    @Override
    public Location findLocationById(final long id) {
        return locationFinder.byId(id);
    }

    @Override
    public List<Driver> findAvailableDriversByLocation(@NotNull final Location location) {
        return driverFinder.db().find(Driver.class).where()
                .eq("location_id", location.id)
                .eq("availability", EDriverAvailability.AVAILABLE)
                .findList();
    }

    @Override
    public List<LocationDistance> findLocationDistancesByLocation(@NotNull final Location location) {
        return locationDistanceFinder.db().find(LocationDistance.class).where()
                .eq("location_a_id", location.id)
                .findList();
    }

    @Override
    public Driver findDriverById(@NotNull final long id) {
        return driverFinder.byId(id);
    }

    @Override
    public Rider findRiderById(@NotNull final long id) {
        return riderFinder.byId(id);
    }

}
