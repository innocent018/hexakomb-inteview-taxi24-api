package models.hexakomb.taxi.api.service;

import models.hexakomb.taxi.api.domain.Trip;

import javax.validation.constraints.NotNull;

public class TaxiService implements ITaxiService{

    @Override
    public Trip createNewTripRequest(@NotNull final Trip trip) {
        trip.save();
        return trip;
    }
}
