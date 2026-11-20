LOG "- Removing legacy Qualcomm AVC decoder declarations"

python3 - "$WORK_DIR/vendor/etc" <<'PY'
import sys
import xml.etree.ElementTree as ET
from pathlib import Path

legacy = {"OMX.qcom.video.decoder.avc", "OMX.qcom.video.decoder.avc.secure"}
for path in Path(sys.argv[1]).glob("media_codecs*.xml"):
    if not any(name in path.read_text() for name in legacy):
        continue
    parser = ET.XMLParser(target=ET.TreeBuilder(insert_comments=True))
    tree = ET.parse(path, parser=parser)
    changed = False
    for decoders in tree.findall("./Decoders"):
        for codec in decoders.findall("MediaCodec"):
            if codec.get("name") in legacy:
                decoders.remove(codec)
                changed = True
    if changed:
        ET.indent(tree, space="    ")
        tree.write(path, encoding="utf-8")
PY
