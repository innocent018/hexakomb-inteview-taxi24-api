package models.hexakomb.taxi.api.service;

import com.google.inject.ImplementedBy;
import models.hexakomb.taxi.api.domain.*;

import java.util.List;

/**
 * The interface Taxi query service.
 */
@ImplementedBy(TaxiQueryService.class)
public interface ITaxiQueryService {

    /**
     * Gets all drivers.
     *
     * @return the all drivers
     */
    List<Driver> getAllDrivers();

    /**
     * Gets all available driver.
     *
     * @param availability the availability
     *
     * @return the all available driver
     */
    List<Driver> getAllAvailableDriver(final EDriverAvailability availability);

    /**
     * Gets all available driver within 3 km.
     *
     * @param availability the availability
     * @param location     the location
     *
     * @return the all available driver within 3 km
     */
    List<Driver> getAllAvailableDriverWithin3Km(final EDriverAvailability availability, final Location location);

    /**
     * Gets driver by id.
     *
     * @param id the id
     *
     * @return the driver by id
     */
    Driver getDriverById(final long  id);

    /**
     * Gets all active trips.
     *
     * @param status the status
     *
     * @return the all active trips
     */
    List<Trip> getAllActiveTrips(final ETripStatus status);

    /**
     * Gets all riders.
     *
     * @return the all riders
     */
    List<Rider> getAllRiders();

    /**
     * Gets rider by id.
     *
     * @param id the id
     *
     * @return the rider by id
     */
    Rider getRiderById(final long id);

    /**
     * Gets closest drivers.
     *
     * @param rider the rider
     *
     * @return the closest drivers
     */
    List<Driver> getClosestDrivers(final Rider rider);

    /**
     * Find location by name location.
     *
     * @param name the name
     *
     * @return the location
     */
    Location findLocationByName(final String name);

    /**
     * Find location by id location.
     *
     * @param id the id
     *
     * @return the location
     */
    Location findLocationById(final long id);

    /**
     * Find available drivers by location list.
     *
     * @param location the location
     *
     * @return the list
     */
    List<Driver> findAvailableDriversByLocation(final Location location);

    /**
     * Find location distances by location list.
     *
     * @param location the location
     *
     * @return the list
     */
    List<LocationDistance> findLocationDistancesByLocation(final Location location);

    /**
     * Find driver by id driver.
     *
     * @param id the id
     *
     * @return the driver
     */
    Driver findDriverById(final long id);

    /**
     * Find rider by id rider.
     *
     * @param id the id
     *
     * @return the rider
     */
    Rider findRiderById(final long id);

}
