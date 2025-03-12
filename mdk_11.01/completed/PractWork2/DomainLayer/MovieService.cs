using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http.Json;
using System.Text;
using System.Threading.Tasks;

namespace DomainLayer
{
    public class MovieService
    {
        private readonly HttpClient _client;
        private readonly string _baseUrl = "http://localhost:5266/api/v1/";

        public MovieService()
        {
            _client = new() { BaseAddress = new Uri(_baseUrl) };
        }

        public async Task<IEnumerable<Movie>> GetMoviesAsync()
        {
            var response = await _client.GetAsync("Movies/");
            response.EnsureSuccessStatusCode();
            return await response.Content.ReadFromJsonAsync<IEnumerable<Movie>>();
        }

        public async Task<Movie> GetMovieById(int id)
        {
            var response = await _client.GetAsync($"Movies/{id}");
            response.EnsureSuccessStatusCode();
            return await response.Content.ReadFromJsonAsync<Movie>();
        }

        public async Task<Uri> AddMovieAsync(Movie movie)
        {
            var response = await _client.PostAsJsonAsync("Movies/", movie);
            response.EnsureSuccessStatusCode();
            return response.Headers.Location;
        }

        public async Task UpdateMovieAsync(Movie movie)
        {
            var response = await _client.PutAsJsonAsync($"Movies/{movie.MovieId}", movie);
            response.EnsureSuccessStatusCode();            
        }

        public async Task<HttpResponseMessage> DeleteMovieAsync(int id)
        {
            var response = await _client.DeleteAsync($"Movies/{id}");
            return response.EnsureSuccessStatusCode();
        }
    }
}
