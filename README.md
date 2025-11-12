# alx-airbnb-database
# Subqueries Practice

## Objective
Practice writing correlated and non-correlated subqueries in SQL.

## Queries Implemented
1. **Properties with Average Rating > 4.0**
   ```sql
   SELECT p.id, p.name, p.location
   FROM properties p
   WHERE p.id IN (
       SELECT r.property_id
       FROM reviews r
       GROUP BY r.property_id
       HAVING AVG(r.rating) > 4.0
   );
