
import Foundation

// Define the URL
if let url = URL(string: "http://localhost:4000/api/users") {
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    
    // Set the Content-Type header
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    let jsonBody: [String: Any] = [
        "user": [
            "email": "usuario6@example.com",
            "password": "passwordseguro"
        ]
    ]
    
    do {
        request.httpBody = try JSONSerialization.data(withJSONObject: jsonBody, options: [])
    } catch {
        print("Error: unable to add JSON body to the request: \(error.localizedDescription)")
    }
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        // Check for errors
        if let error = error {
            print("Error: \(error.localizedDescription)")
            return
        }
        
        // Check for valid HTTP response
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            print("Error: Invalid response or status code")
            return
        }
        
        // Handle the response data
        if let data = data, let responseDataString = String(data: data, encoding: .utf8) {
            print("Response data: \(responseDataString)")
        }
    }
    
    // Start the task
    task.resume()
}

func postUser(email: String, password: String) {
    let semaphore = DispatchSemaphore(value: 0) // Create a semaphore to wait for the network request to complete

    guard let url = URL(string: "http://localhost:4000/api/users") else {
        print("Invalid URL")
        return
    }
    
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    let jsonBody: [String: Any] = [
        "user": [
            "email": email,
            "password": password
        ]
    ]
    
    do {
        request.httpBody = try JSONSerialization.data(withJSONObject: jsonBody, options: [])
    } catch {
        print("Error: unable to add JSON body to the request: \(error.localizedDescription)")
        return
    }
    
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        defer { semaphore.signal() } // Ensure semaphore signal is called even if an early return occurs
        
        if let error = error {
            print("Error: \(error.localizedDescription)")
            return
        }
        
        guard let httpResponse = response as? HTTPURLResponse else {
            print("Error: Invalid response")
            return
        }
        
        if (200...299).contains(httpResponse.statusCode), let data = data, let responseDataString = String(data: data, encoding: .utf8) {
            print("Response data: \(responseDataString)")
        } else {
            print("Error: Invalid response or status code \(httpResponse.statusCode)")
        }
    }
    
    task.resume()
    semaphore.wait() // Wait for the semaphore signal
}

// Adjust the parameters as needed for your test
postUser(email: "usuario9@example.com", password: "passwordseguro")
