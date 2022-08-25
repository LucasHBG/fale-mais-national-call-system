# Get Flutter SDK and Android SDK
FROM cirrusci/flutter:3.0.5 AS build

# Set work directory of this project
WORKDIR /app

# Copy the pubspec.yaml as well as the analysis_options.yaml and install 
# the dependencies. This is a separate step so the dependencies 
# will be cached unless changes to one of those two files are made 
COPY ./pubspec.yaml ./
COPY ./analysis_options.yaml ./
RUN flutter pub get

# Copy the main application
COPY . .

RUN flutter doctor

RUN flutter build