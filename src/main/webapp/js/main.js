function signIn() {
    const username = document.getElementById("T1").value;
    const password = document.getElementById("T2").value;

    if (!username || !password) {
        swal("Error", "All fields are required!", "error");
        return;
    }

    const data = JSON.stringify({ username, password });

    fetch("http://localhost:8080/user/login", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: data,
    })
    .then((response) => {
        if (response.status === 401) {
            // Invalid credentials
            swal("Error", "Invalid credentials!", "error");
        } else if (response.status === 200) {
            // Successful login
            response.text().then((message) => {
                if (message === "User logged in successfully!") {
                    swal("Success", message, "success").then(() => {
                        window.location.href = "home.jsp"; // Redirect to home page
                    });
                } else {
                    swal("Error", "Unexpected error, please try again!", "error");
                }
            });
        } else {
            swal("Error", "Something went wrong with the server!", "error");
        }
    })
    .catch((error) => {
        console.error("Error:", error);
        swal("Error", "Something went wrong with the request!", "error");
    });
}
