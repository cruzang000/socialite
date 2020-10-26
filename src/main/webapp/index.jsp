<html>

<%-- include head --%>
<%@ include file = "/jsp/head.jsp" %>

<%-- include nav bar --%>
<%@ include file = "/jsp/navbar.jsp" %>

<body>
<noscript>enable javascript to get full functionality!</noscript>

<div class="col-12 bg-navy text-white d-flex flex-wrap shadow-sm rounded">
    <section class="d-flex flex-row align-items-end">
        <h2>Plans Tonight?</h2>
        <div>
            <div>
                <figure>
                    <img src="" alt="">
                </figure>

                <figure>
                    <img src="" alt="">
                </figure>

                <figure>
                    <img src="" alt="">
                </figure>

                <figure>
                    <img src="" alt="">
                </figure>
            </div>
            <h3>See whats poppin' and who's there!</h3>
        </div>
    </section>
    <form id="locationSearchForm" class="d-flex flex-wrap align-items-center">

        <div class="col-10 px-1">
            <input type="text" aria-label="zipcode" name="location" placeholder="WHERE YOU AT: enter zipcode"
                   class="transparent border border-white rounded white-placeholder col-12 text-center p-0">
        </div>

        <button type="submit" id="locationSearch" class="btn bg-dark-navy btn-outline-light col-2">Go</button>

        <small id="searchZipcodeError" class="error text-danger col-12">Must enter a valid 5 digit zip code!</small>
    </form>
</div>


<div id="resultsContainer" class="card-deck">
    <div id="results"></div>
    <template id="template-card">
        <div class="card bg-navy text-white">
            <div class="card-body">
                <figure>
                    <img src="" alt="card-image">
                </figure>
                <section>
                    <h3></h3>
                    <ul class="list-unstyled">
                        <li></li>
                        <li></li>
                        <li></li>
                    </ul>
                </section>
            </div>
            <div class="card-footer">
            </div>
        </div>
    </template>
</div>

<script src="js/landingPage/LocationSearch.js" type="module"></script>
</body>

</html>
