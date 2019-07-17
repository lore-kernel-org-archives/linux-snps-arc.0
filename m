From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Wed, 17 Jul 2019 21:09:29 +0000
Subject: [GIT PULL] drm/arc: Minor improvements
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CY4PR1201MB0120FDB10A777345F9C27720A1C90@CY4PR1201MB0120.namprd12.prod.outlook.com>
To: linux-snps-arc@lists.infradead.org

Hi Dave, Daniel,

The following changes since commit 7aaddd96d5febcf5b24357a326b3038d49a20532:

  drm/modes: Don't apply cmdline's rotation if it wasn't specified (2019-07-16 10:34:38 +0200)

are available in the Git repository at:

  git at github.com:abrodkin/linux.git tags/arcpgu-updates-2019.07.18

for you to fetch changes up to cee17a71656e9e1b5ffc01767844026550d5f4a9:

  drm/arcpgu: rework encoder search (2019-07-17 23:36:56 +0300)

----------------------------------------------------------------
This is a pretty simple improvement that allows to find encoder
as the one and only (ARC PGU doesn't support more than one) endpoint
instead of using non-standard "encoder-slave" property.

----------------------------------------------------------------
Eugeniy Paltsev (1):
      drm/arcpgu: rework encoder search

 drivers/gpu/drm/arc/arcpgu_drv.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

Regards,
Alexey
