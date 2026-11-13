# Piano sheet transcription

Automatic transcription of a ~1:50 solo-piano recording (C♯ minor) into sheet music.

## Outputs (`sheet/`)
- `piano-sheet.pdf` – the engraved two-staff score (57 bars, 4/4, C♯ minor)
- `piano-sheet.ly` – LilyPond source, edit and re-render with `lilypond piano-sheet.ly`
- `piano-sheet-quantized.mid` – MIDI of the notated score (import into MuseScore to edit)
- `raw-transcription.mid` – unquantized performance MIDI straight from the model

## Pipeline (`transcribe/`)
1. `basic-pitch out audio.wav --save-note-events` → note events (`notes.csv`)
2. `python transcribe.py notes.csv score.ly 7.3 103.5` (the time window skips the
   silence/noise before the music starts)
   - `quantize.py`: dynamic-programming beat tracker that follows rubato (the tempo
     drifts between beats) and picks a per-beat subdivision (8ths, 16ths or triplets)
   - `notate.py`: hand split, chord limits, tie-free rhythm spelling, clef changes,
     C♯-minor pitch spelling
3. `lilypond score.ly` → PDF + MIDI

Requirements: Python 3.11, `basic-pitch[onnx]`, `numpy`; LilyPond 2.24.

## Limitations
Machine transcription of a rubato performance: pitches are mostly reliable, rhythms are
a best-fit guess, and the sustain pedal is not notated. Proofread against the recording.
