async function criarDropdown()
{
    const select = document.querySelector("select");
    const areaEpisodios = document.querySelector(".episodios");

    const resposta = await fetch(`../lib/buscarTemporadas.aspx?serie=${cdSerie}`);
    const temporadas = await resposta.json();

    temporadas.temporadas.forEach(temporada => {
        let option = document.createElement("option");
        option.setAttribute("value", temporada);
        option.textContent = `${temporada}º Temporada`;

        select.appendChild(option);
    });

    temporadas.eps.forEach(ep => {
        const div = document.createElement("div");
        div.classList.add("epDiv");
        div.innerHTML = `
            <h4>S${ep.cdTemporada}E${ep.cdEpisodio} - ${ep.nmOriginalEp}</h4>
            <p>${ep. nmAdotadoEp} - Exibição em: ${ep.dtExibicaoEp} - ${ep.duracaoEp} min</p>

            <br>

            <div>
                <p>${ep.sinopseEp}
                </p>

                <br>

                <p>Observação: <br> ${ep.obsEp}</p>
            </div>
        `;

        areaEpisodios.appendChild(div);
    });

    select.addEventListener("change", mudarEps);
}

async function mudarEps(e)
{
    const temporada = e.target.value;
    const areaEpisodios = document.querySelector(".episodios");
    const h3Temporada = document.querySelector("#temporada");

    const resposta = await fetch(`../lib/buscarTemporadas.aspx?serie=${cdSerie}&t=${temporada}`);
    const temporadas = await resposta.json();

    document.querySelectorAll(".epDiv").forEach(ep => {
        ep.remove();
    });

    h3Temporada.textContent = `${temporada}° Temporada`;

    temporadas.eps.forEach(ep => {
        const div = document.createElement("div");
        div.classList.add("epDiv");
        div.innerHTML = `
            <h4>S${ep.cdTemporada}E${ep.cdEpisodio} - ${ep.nmOriginalEp}</h4>
            <p>${ep.nmAdotadoEp} - Exibição em: ${ep.dtExibicaoEp} - ${ep.duracaoEp} min</p>

            <br>

            <div>
                <p>${ep.sinopseEp}
                </p>

                <br>

                <p>Observação: <br> ${ep.obsEp}</p>
            </div>
        `;

        areaEpisodios.appendChild(div);
    });
}

const urlParams = new URLSearchParams(window.location.search);
const cdSerie = urlParams.get("serie");

criarDropdown();