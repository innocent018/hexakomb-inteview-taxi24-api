package controllers;

import models.hexakomb.taxi.api.domain.*;
import models.hexakomb.taxi.api.service.ITaxiQueryService;
import models.hexakomb.taxi.api.service.ITaxiService;
import play.*;
import play.data.Form;
import play.data.FormFactory;
import play.libs.Json;
import play.mvc.*;

import views.html.*;

import javax.inject.Inject;
import java.time.LocalDate;
import java.util.List;

public class Application extends Controller {

    private ITaxiQueryService taxiQueryService;
    private ITaxiService taxiService;
    private FormFactory formFactory;

    @Inject
    Application(final ITaxiQueryService taxiQueryService, final ITaxiService taxiService, final FormFactory formFactory){
        this.taxiQueryService = taxiQueryService;
        this.taxiService = taxiService;
        this.formFactory = formFactory;
    }

    public Result index(){
        return ok(index.render());
    }

    public Result getDrivers(){
        List<Driver> drivers = taxiQueryService.getAllDrivers();
        return ok(Json.toJson(drivers));
    }

    public Result getAvailableDrivers(){
        List<Driver> drivers = taxiQueryService.getAllAvailableDriver(EDriverAvailability.AVAILABLE);
        return ok(Json.toJson(drivers));
    }

    public Result getDriverById(final long id){
        Driver driver = taxiQueryService.getDriverById(id);
        return ok(Json.toJson(driver));
    }


    public Result getRiders(){
        List<Rider> riders = taxiQueryService.getAllRiders();
        return ok(Json.toJson(riders));
    }

    public Result getRiderById(final long id){
        Rider rider = taxiQueryService.getRiderById(id);
        return ok(Json.toJson(rider));
    }

    public Result getAllAvailableDriverWithin3Km(final String locationName){
        Location location = taxiQueryService.findLocationByName(locationName);
        List<Driver> drivers = taxiQueryService.getAllAvailableDriverWithin3Km(EDriverAvailability.AVAILABLE, location);
        return ok(Json.toJson(drivers));
    }


    public Result getAllAvailableDriverWithin3KmById(final long id){
        Location location = taxiQueryService.findLocationById(id);
        List<Driver> drivers = taxiQueryService.getAllAvailableDriverWithin3Km(EDriverAvailability.AVAILABLE, location);
        return ok(Json.toJson(drivers));
    }

    public Result tripRequest(){

        Form<Trip> tripForm = formFactory.form(Trip.class).bindFromRequest();
        Location location = taxiQueryService.findLocationById(Long.parseLong(tripForm.field("location").getValue().get()));
        Driver driver = taxiQueryService.findDriverById(Long.parseLong(tripForm.field("driver").getValue().get()));
        Rider rider = taxiQueryService.findRiderById(Long.parseLong(tripForm.field("rider").getValue().get()));

        Trip trip = new Trip();
        trip.driver = driver;
        trip.rider = rider;
        trip.location = location;
        trip.tripDate = LocalDate.now();
        trip.status = ETripStatus.REQUESTED;

        Trip tripObj = taxiService.createNewTripRequest(trip);

        return ok(Json.toJson(tripObj));
    }

    public Result getActiveTrips(){
        List<Trip> trips = taxiQueryService.getAllActiveTrips(ETripStatus.ACTIVE);
        return ok(Json.toJson(trips));
    }

}
