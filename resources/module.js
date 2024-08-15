async function MockMusic(page) {
    const testData = {
        "id": 1,
        "title": "Music with 5 seconds",
        "artist": "Marina",
        "image": "https://raw.githubusercontent.com/qaxperience/mock/main/covers/nevertesting.jpg",
        "type": "album",
        "src": "https://raw.githubusercontent.com/qaxperience/mock/main/songs/nirvana.mp3"
    }
    
    await page.route('**/songs', route => route.fulfill({
        status: 200,
        body: JSON.stringify([testData])
    }))
}
exports._esModule = true;
exports.MockMusic = MockMusic;