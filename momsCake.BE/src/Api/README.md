## Overview
This repository serves for MomsCake backend, follows Clean Architecture
and Domain-Driven Design.

## Architecture
TODO: Insert CA Image

- **Presentation Layer**: In codebase is src/Api/Host -> In the backend project, it is RestAPI, gRPC, ...
or any kind of method that Client(UI, SPA, Web, Mobile,etc.) can interact with.
- **Infrastructure Layer**: Is where persistence, DB Connection, Identity, Repository, 
Service reside in.
- **Application Layer**: Is where business logic, handlers, commands/queries handlers in CQRS (using MediatR),
validation, and also calling Repository/Service defined in Infrastructure Layer.
- **Domain Layer**: Is where entity, value object, domain events reside in.