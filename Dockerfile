# Use a lightweight Python image
FROM python:3.12-slim

# Set the working directory in the container
WORKDIR /app

# Copy the dependency files first
COPY pyproject.toml uv.lock ./

# Install uv (the package manager you are using) and dependencies
RUN pip install uv && uv pip install --system -e .

# Copy the rest of the application code
COPY travel_planner/ ./travel_planner/

# Expose the port the app runs on (assuming FastAPI/Uvicorn on 8000)
EXPOSE 8000

# Command to run the agent server
CMD ["python", "travel_planner/agent.py"]
