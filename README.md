```markdown
# FastAPI Book Management API

## Overview

This project is a RESTful API built with FastAPI for managing a book collection. It provides comprehensive CRUD (Create, Read, Update, Delete) operations for books with proper error handling, input validation, and auto-generated documentation. The project is containerized with Docker and is set up for continuous deployment on Railway.

## Features

- 📚 Book management (CRUD operations)
- ✅ Input validation using Pydantic models
- 🔍 Enum-based genre classification
- 🧪 Complete test coverage with pytest
- 📝 API documentation (Swagger UI and ReDoc auto-generated by FastAPI)
- 🚀 Containerized deployment with Docker
- ☁️ Continuous Deployment on Railway via GitHub Actions

## Project Structure

```
fastapi-book-project/
├── api/
│   ├── db/
│   │   ├── __init__.py
│   │   └── schemas.py      # Data models and in-memory database
│   ├── routes/
│   │   ├── __init__.py
│   │   └── books.py        # Book route handlers
│   └── router.py           # API router configuration
├── core/
│   ├── __init__.py
│   └── config.py           #  Application settings
├── tests/
│   ├── __init__.py
│   └── test_books.py       # API endpoint tests
├── main.py                 # Application entry point
├── requirements.txt        # Project dependencies
└── README.md
```

## Technologies Used

- Python 3.12 (or as specified by your base image)
- FastAPI
- Pydantic
- Uvicorn
- Docker
- Railway
- pytest

## Installation

### Local Development

1. **Clone the repository:**

   ```bash
   git clone https://github.com/hng12-devbotops/fastapi-book-project.git
   cd fastapi-book-project
   ```

2. **Create and activate a virtual environment:**

   ```bash
   python -m venv venv
   source venv/bin/activate  # On Windows: venv\Scripts\activate
   ```

3. **Install dependencies:**

   ```bash
   pip install -r requirements.txt
   ```

## Running the Application

### Using Uvicorn (Local Testing without Docker)

1. **Start the server:**

   ```bash
   uvicorn main:app --reload
   ```

2. **Access the API documentation:**

   - Swagger UI: [http://localhost:8000/docs](http://localhost:8000/docs)
   - ReDoc: [http://localhost:8000/redoc](http://localhost:8000/redoc)

### Using Docker

1. **Build the Docker image:**

   ```bash
   docker build -t fastapi-nginx-app .
   ```

2. **Run the Docker container:**

   ```bash
   docker run -d -p 80:80 fastapi-nginx-app
   ```

3. **Access the application:**

   The API endpoints will be available on `http://localhost` (Nginx will proxy requests to FastAPI).

## Deployment with Railway

This project is configured for continuous deployment on Railway using Docker. A GitHub Actions workflow (in `.github/workflows/cd.yml`) triggers deployments on pushes to the `main` branch.

### Manual Deployment Steps

1. **Install Railway CLI:**

   Ensure you have the Railway CLI installed:

   ```bash
   npm install -g @railway/cli
   ```

2. **Log in to Railway:**

   ```bash
   railway login
   ```

3. **Deploy the Project:**

   From the project root, run:

   ```bash
   railway up --detach --service fastapi-book-project
   ```

   Railway will index, compress, and upload your project. You can view the build logs via the URL provided in the CLI output.

### Automatic Deployments

- **GitHub Actions:**  
  The CD workflow in `.github/workflows/cd.yml` automatically builds and deploys your project when changes are pushed to the `main` branch.  
- **Secrets:**  
  Ensure that your GitHub repository’s secrets include `RAILWAY_TOKEN` for authentication.

## API Endpoints

### Books

- `GET /books/` - Get all books
- `GET /books/{book_id}` - Get a specific book
- `POST /books/` - Create a new book
- `PUT /books/{book_id}` - Update a book
- `DELETE /books/{book_id}` - Delete a book

### Health Check

- `GET /healthcheck` - Check API status

## Book Schema

```json
{
  "id": 1,
  "title": "Book Title",
  "author": "Author Name",
  "publication_year": 2024,
  "genre": "Fantasy"
}
```

Available genres:

- Science Fiction
- Fantasy
- Horror
- Mystery
- Romance
- Thriller

## Running Tests

Run tests locally using pytest:

```bash
pytest
```

## Error Handling

The API includes proper error handling for:

- Non-existent books (returns 404)
- Invalid book IDs and malformed requests (returns 422 or 400)
- Invalid genre types

## Contributing

1. Fork the repository.
2. Create a feature branch:

   ```bash
   git checkout -b feature/AmazingFeature
   ```

3. Commit your changes:

   ```bash
   git commit -m 'Add AmazingFeature'
   ```

4. Push to your branch:

   ```bash
   git push origin feature/AmazingFeature
   ```

5. Open a Pull Request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Support

For support, please open an issue in the GitHub repository.
```
