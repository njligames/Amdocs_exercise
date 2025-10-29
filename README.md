## Amdocs Roku coding challenge.

How to get started.

1. Check out this project (or unzip files from .zip).
2. Make sure npm is installed with: `brew install npm`
3. Install yarn and gulp
   - `npm install -g yarn gulp` - _This installs yarn and gulp as global terminal commands._
4. Run `yarn` - _Make sure you run this one from the project root directory._
5. Run `gulp` - _To produce a deployable package. It will be created in the 'out' folder._
6. Run `gulp test` - _To produce a package with unit tests._

---

## **Roku Channel Instructions**

**Configuration:**

To change the configuration of the logger, open:
`source/config/config.json`.
You can modify the parameters in the following block:

```json
{
  "disableLogging": false,
  "logLevel": 5,
  "name": "Default"
}
```

Parameter description:

- `disableLogging`
  Enable or disable debugging logs.
- `logLevel`
  There are 6 levels; 5 (TRACE) is the most verbose.
- `name`
  The name of this logger.

**Using the Channel:**

- **Play / Pause:**
  Toggle the **Pause/Play** button to pause or resume the video.

- **Fast Forward:**
  Press the **Fast Forward** button to advance playback.
  The video will pause during fast-forwarding. Press again to resume playback.

- **Rewind:**
  Press the **Rewind** button to reverse playback.
  The video will pause during rewinding. Press again to resume playback.

- **On-Screen Logging:**

  - Logs are displayed with the **newest entries at the top**.
  - Press the **Config** button to **enable or disable** on-screen logging.
  - Press the **Info** button to **display control instructions** in the on-screen logging area.
