from fastapi import APIRouter

from api.routes import books
from api.health import router as health_router

api_router = APIRouter()
api_router.include_router(books.router, prefix="/books", tags=["books"])
api_router.include_router(health_router)