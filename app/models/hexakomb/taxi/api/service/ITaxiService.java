package models.hexakomb.taxi.api.service;

import com.google.inject.ImplementedBy;
import models.hexakomb.taxi.api.domain.Trip;

@ImplementedBy(TaxiService.class)
public interface ITaxiService {
    Trip createNewTripRequest(final Trip trip);
}
