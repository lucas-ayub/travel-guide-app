# Handoff: Trip Atlas (travel-guide-app)

## Contexto
Sou o Lucas. Criei com o Claude (no chat) um web app de mapas de viagem chamado **Trip Atlas**, para usar no iPhone (Safari → Adicionar à Tela de Início). O app é um único `index.html` (HTML/CSS/JS puro + Leaflet via cdnjs), mais um `icon.png` e um `README.md`. Quero reaproveitá-lo em outras viagens.

- Repositório GitHub (já criado, **vazio**): https://github.com/lucas-ayub/travel-guide-app
- Branch a usar: `main`
- URL final esperada (GitHub Pages): https://lucas-ayub.github.io/travel-guide-app/
- Os três arquivos (`index.html`, `icon.png`, `README.md`) estão em `~/Downloads` (versão mais recente do `index.html` = a que usa tiles do OpenStreetMap).

## O que eu quero que você faça
1. Criar `~/projects/travel-guide-app`, mover para lá `index.html`, `icon.png` e `README.md` de `~/Downloads`.
2. Confirmar que o `index.html` usa `https://tile.openstreetmap.org/{z}/{x}/{y}.png` (e **não** `basemaps.cartocdn.com`, que passou a exigir API key e mostra "API KEY REQUIRED" no github.io). Se ainda estiver com CARTO, trocar pelo trecho abaixo.
3. `git init -b main`, `git remote add origin https://github.com/lucas-ayub/travel-guide-app.git`, commit e `git push -u origin main`.
   - Se o push pedir credenciais, me ajudar a autenticar com `gh auth login` (GitHub CLI, HTTPS, login pelo navegador). Não usar minha senha.
4. Me lembrar de ativar o Pages: **Settings → Pages → Deploy from a branch → main / (root) → Save**.
5. Adicionar um `.gitignore` simples (`.DS_Store`).

Trecho correto dos tiles (função `setTiles`) e CSS do modo escuro:
```js
tiles = L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png',{
  maxZoom:19, className: dark.matches ? 'tiles-dark' : '',
  attribution:'© <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>'
}).addTo(map);
```
```css
.tiles-dark{filter:invert(1) hue-rotate(180deg) brightness(.9) contrast(.9) saturate(.6)}
```

## Como o app funciona (para futuras alterações)
- **Tudo em `index.html`**. Sem build, sem dependências além de Leaflet 1.9.4 (cdnjs) e Google Fonts (Bricolage Grotesque + Figtree).
- **Dados**: `localStorage` chave `roteiros.v1` → `{trips:[{id,name,dates,groups:[{id,name,color}],places:[{id,name,lat,lon,group,note,wiki}]}], current}`. Cache de fotos/textos em `roteiros.info.v1`. Na primeira abertura, carrega a viagem de exemplo `seedTrip()` (Copenhague + Malmö, 24–26 out 2026).
- **Fotos**: para cada lugar, busca o artigo na Wikipedia em inglês (campo `wiki` → busca por nome perto das coordenadas → geosearch), e até ~7 fotos do Wikimedia Commons tiradas num raio de 120–400 m (API com `origin=*`).
- **Busca de lugares**: Nominatim (OpenStreetMap). Segurar o dedo no mapa também adiciona um lugar.
- **Localização**: `navigator.geolocation.watchPosition` (exige HTTPS; funciona no GitHub Pages). Mostra ponto azul e distância até cada lugar.
- **Rotas**: botões abrem Google Maps (transporte público) ou Apple Maps; o app não calcula rotas.
- **Importar/Exportar**: importa `.kml` do Google My Maps (cada Folder vira um grupo) e backup `.json`; exporta backup `.json` (via Web Share no iPhone).
- **UI em inglês**; grupos = dias/cidades com cor e numeração no mapa.

## Viagem de exemplo já embutida (Copenhague + Malmö)
Chegada CPH sáb 24/10 07:55, partida seg 26/10 18:20, hotel CityHub Copenhagen (Vesterbrogade 97B).
- Sáb: Glyptotek (opcional) → Christiansborg → Black Diamond → LEGO Store → Old University Library → Rosenborg → Frederiks Kirke → Amalienborg → Canal Tour (Nyhavn) → Nyhavn → Gasoline Grill → Tivoli.
- Dom: Designmuseum → Kastellet → Pequena Sereia → Grundtvigs Kirke (dom 12:30–15:45; fechada sáb/seg) → Louisiana (até 18h) → Christianshavns Kanal.
- Seg (Malmö, bate-volta com mala): Malmö C → St. Petri → Stortorget → Lilla Torg → Malmöhus (fechado seg) → Ribersborgs Kallbadhus → Turning Torso → trem direto ao aeroporto (22 min).
- Copenhagen Card Discover 48h (859 DKK) vale a pena só fazendo ~6 atrações pagas; ativar no trem do aeroporto no sábado.

## Ideias futuras (não fazer agora, só se eu pedir)
- Modo offline melhor (service worker para cachear tiles/fotos).
- Sincronizar viagens entre aparelhos.
- Ícone/manifest PWA completo.
