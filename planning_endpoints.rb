>> CLIENTS <<

  ## List all clients
    GET base_url/api/v1/clients

    + Response 200 (application/json)

    [
      {
        "id": 2,
        "first_name": "Linas",
        "last_name": "Uloza",
        "notes": "Stiprus",
        "email": "linas.uloza@gmail.com",
        "active": true,
        "created_at": "2015-11-11T03:05:29.272Z",
        "updated_at": "2015-11-11T03:05:29.272Z",
        "api_key": "iB3KtsHbNbZAsaUKj5xarwtt"
      }
    ]

  ## Create new client
    POST base_url/api/v1/clients

    + Request (application/json)

    { "client":
      {   
      "first_name": "Aiste",
        "last_name": "Ulo",
        "notes": "Greita",
        "email": "aiste@aiste.ca",
        "active": true
      }
    }

    + Response 200 (application/json)
    
    {
        "message": "client created"
    }


  ## Show specific client
    GET base_url/api/v1/clients/{:id}

      + HEADER
      Authorization Token token="iB3KtsHbNbZAsaUKj5xarwtt"

      + Response 200 (application/json)

     {
        "id": 2,
        "first_name": "Linas",
        "last_name": "Uloza",
        "notes": "Stiprus",
        "email": "linas.uloza@gmail.com",
        "active": true,
        "created_at": "2015-11-11T03:05:29.272Z",
        "updated_at": "2015-11-11T03:05:29.272Z",
        "api_key": "iB3KtsHbNbZAsaUKj5xarwtt"
      }

     + Response 404 (application/json)

      {
          "error": "client (client id) does not exist"
      }

    + Response 401 #Unauthorized

      HTTP Token: Access denied.

  ## Update/Edit specific client
    PUT base_url/api/v1/clients/{:id}
      
      + HEADER
      Authorization Token token="iB3KtsHbNbZAsaUKj5xarwtt"

      + Request (application/json)

      Content-Type application/json

      { "client":
        {   
          "first_name": "Zaneta"
        }
      }

     + Response 200 (application/json)


     + Response 404 (application/json)


  ## Delete specific client
    DELETE base_url/api/v1/clients/{:id}

    + Response 200 (application/json)
        
        {
            "message": "client created"
        }






>> GYMS <<

  ## List all gyms
    GET base_url/api/v1/gyms

  ## Create new gyms
    POST base_url/api/v1/gyms

  ## Update/Edit specific gym
    PUT base_url/api/v1/gyms/{:id}

  ## Delete specific client
    DELETE base_url/api/v1/gyms/{:id}

>> GYMS && clientS <<

  ## List of clients at the gym
    GET base_url/api/V1/gyms/{:id}/clients

  ## List of gyms that client belongs to
    GET base_url/api/V1/clients/{:id}/gyms

>> WORKOUT

  ## List all workouts
    GET base_url/api/v1/clients

  ## Create new workout
    POST base_url/api/v1/workouts

  ## Show specific workout
    GET base_url/api/v1/workouts/{:id}

  ## Update/Edit specific workout
    PUT base_url/api/v1/workouts/{:id}

  ## Delete specific workout
    DELETE base_url/api/v1/workouts/{:id}

>> WORKOUT && TYPE

  ## Workout list of specific type
    GET base_url/api/v1/type/{:id}/workouts

>> EXERCISE

  ## List all exercises
    GET base_url/api/v1/clients

  ## Create new exercise
    POST base_url/api/v1/exercises

  ## Show specific exercise
    GET base_url/api/v1/exercises/{:id}

  ## Update/Edit specific exercise
    PUT base_url/api/v1/exercises/{:id}

  ## Delete specific exercise
    DELETE base_url/api/v1/exercises/{:id}

>> EXERCISE && TOOL

  ## Exercise list of specific tool
    GET base_url/api/v1/tool/{:id}/exercises

>> EXERCISE && MUSCLE

  ## Exercise list of specific muscle
    GET base_url/api/v1/muscle/{:id}/exercises


