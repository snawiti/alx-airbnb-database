# Implement Indexes for Optimization

## Objective
Enhance query performance in the Airbnb database by identifying and indexing high-usage columns.

---

## Step 1: Identify High-Usage Columns

| Table | High-Usage Columns | Reason |
|-------|--------------------|--------|
| `users` | `id`, `email` | Used in `JOIN` and `WHERE` clauses |
| `bookings` | `user_id`, `property_id`, `created_at` | Used in joins, filters, and ordering |
| `properties` | `id`, `location` | Frequently used for lookups and filtering |

---

## Step 2: Create Indexes

```sql
CREATE INDEX idx_users_email ON users (email);
CREATE INDEX idx_bookings_user_id ON bookings (user_id);
CREATE INDEX idx_bookings_property_id ON bookings (property_id);
CREATE INDEX idx_properties_location ON properties (location);