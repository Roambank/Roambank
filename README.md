# Roambank

## Table of Contents

1. [Overview](#overview)
2. [User Stories](#user-stories)
3. [Entity Relationship Diagram](#entity-relationship-diagram)
4. [Architecture](#architecture)
   - [Presentation Layer](#presentation-layer)
   - [Business Logic Layer](#business-logic-layer)
   - [Data Access Layer](#data-access-layer)
5. [Layers and Functions](#layers-and-functions)
   - [Infrastructure Layer](#infrastructure-layer)
   - [Data Access Layer](#data-access-layer)
   - [Business Layer](#business-layer)
   - [Helper Layer](#helper-layer)
   - [Web-Main Layer](#web-main-layer)
6. [Getting Started](#getting-started)
7. [Configuration](#configuration)
8. [Commit Message Guidelines](#commit-message-guidelines)
9. [License](#license)

## Overview
Roambank is an innovative waste management application that enables users to responsibly recycle their waste by requesting pick-up services. 
The app provides detailed preparation steps for different types of waste, helping users to prepare their waste properly and earn more rewards from waste banks or communities. 
Additionally, the app allows users to track their contributions, supporting further engagement with waste management initiatives.

## User Stories
- As a user, I want to request pick-up for recycling my waste so that I can dispose of my trash responsibly.
- As a user, I want to know how to prepare my waste accordingly before distributing it to the waste bank so that I can help the waste bank and earn more rewards.
- As a user, I want to track what contribution I make from distributing my trash to waste bank or communities so that I can support the communities further.

## Entity Relationship Diagram
Berikut adalah diagram hubungan entitas (ERD) yang digunakan dalam sistem Roambank:
**Figure:** ERD Roambank</br>
<img src="https://github.com/user-attachments/assets/f79a803e-5571-4d4b-9a03-70cf91b7583b" width="500"/>

## Architecture
### MVVM
Recykloo follows the Model-View-ViewModel (MVVM) architectural pattern to maintain a clear separation of concerns and enhance code maintainability and testability.


## Layers and Functions
### Model
The Model layer is responsible for the application’s data structure. It defines the core data entities and their relationships.

### View
The View layer is responsible for the UI components and layout. It provides the user interface elements that users interact with.

### ViewModel
The ViewModel layer acts as an intermediary between the Model and View layers. It handles the business logic and state management.

## Commit Message Guidelines
Use the following format for commit messages:
- `feat`: Addition of a new feature
- `fix`: Bug fixes
- `docs`: Changes to documentation
- `style`: Changes that do not affect the code (e.g., formatting, whitespace, punctuation)
- `refactor`: Code changes that neither fix a bug nor add a feature
- `test`: Adding or updating tests
- `chore`: Updates to build tasks, package management, etc.
