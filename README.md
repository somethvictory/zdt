# README

Zendesk Test Project

### Requirements

- Ruby >= 2.3.0
- Rails >= 5.0.7

### Setup
- clone the this repo
- cd into the cloned repo, run `bundle install`
- run `rails server` to start the server

### Features
There are only one main api end point which allows the user to find the shortest route of the MRT.

- To find the shortest routes without time cost, visit `http://localhost:3000/shortest_routes?source=Boon%20Lay&destination=Little%20India&start_time=2019-01-31T07:00`

- To find the shortest routes with time cost(with params `time_optimised=true`), visit `http://localhost:3000/shortest_routes?source=Boon%20Lay&destination=Little%20India&start_time=2019-01-31T07:00&time_optimised=true`

- Replace the `source`, `destination` and `start_time` to see different results.

- The response include:
  - `number_of_station` the number of total station to be passed by
  - `duration` if `time_optimised=true` is specified, the duration should contain integer number in minutes, else, the `duration` will always return `0`
  - `source` where the trip is started
  - `destination` where the trip is ended
  - `start_time` the time when the trip is started
  - `steps` array of steps which the trip will take


### Test
- to run all test, run `rake` or `rspec`


### NOTE:
Due to the time limit, the duration is still wrongly calculated.
