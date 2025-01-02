# ER Diagram Generator

This project is a Python script that generates an Entity-Relationship (ER) diagram from a SQL database schema. The diagram is saved as an image file. The script is packaged in a Docker container for easy usage.

## Requirements

Before running this project, ensure that you have the following installed:

- Docker (for building and running the container)
- `Make` (optional, for convenience in managing Docker tasks)

## Getting Started

### 1. Clone the Repository

Clone the repository to your local machine:

```bash
git clone https://github.com/MaikMike/actions-er-diagram-generator.git
cd actions-er-diagram-generator
```

### 2. Build and run docker image

```bash
docker build -t er-diagram-generator .
docker run \
        -e DB_URL="postgresql://<USER>:<PASSWORD>@<HOST>/<DB>" \
        -e OUTPUT_FILE="your_output.png" \
        -v $(pwd):/app \
        er-diagram-generator
```
