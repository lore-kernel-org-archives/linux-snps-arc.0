Return-Path: <SRS0=7v8Z=3U=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C4DAC2D0DB
	for <linux-snps-arc@archiver.kernel.org>; Fri, 31 Jan 2020 15:25:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F398206D5
	for <linux-snps-arc@archiver.kernel.org>; Fri, 31 Jan 2020 15:25:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HMUiXGa/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="VG8389gw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F398206D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=nxjFF5cwyqplBA81urgA0b2qZhzt9eC7Nihe7pChio4=; b=HMU
	iXGa/GItN+l2jdAI6B2AD/0cuk8BVUE331Y6XJdE33+f5TToWPvy/nrQeQboxMGLV3KwjObd3oHGe
	w11DFjGNuyRQwafWEg5MUqj+dtdg2YsUXUVVOyNGgcdWtCni+RMWeF84kL/7KV6N0ZmXD23hxH4L3
	j4qXqwckJdP5yd6hVw/T6Rd3DyRQgJXZUBAgVc9w5aVjunLp+VGiCrUDHEzMCtPqAgj6m47/y5xPx
	ikawEzzRAw98Y248Sijq7PBLCcgYutJFQRQQcITX6tusPYVr6iMF36iQr4K5qpPBzuMS0Iqix+C5B
	Nrqc80Nt/uaJ6S6uiEGOoRAh/DdhF8A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ixYB9-0007FD-3d; Fri, 31 Jan 2020 15:25:55 +0000
Received: from us03-smtprelay2.synopsys.com ([149.117.87.133]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ixYB6-0007EV-LJ
 for linux-snps-arc@lists.infradead.org; Fri, 31 Jan 2020 15:25:53 +0000
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id BA005C057A;
 Fri, 31 Jan 2020 15:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1580484350; bh=lcoAa7VqB7NirC/myBLSakmDMyizo7a5wkGDAM+kf6o=;
 h=From:To:Cc:Subject:Date:From;
 b=VG8389gwPt2jxUvak4Q/mO0PJL4zFYZ8vps2aU3Fxc0gNehr4yzHohQCQnqpjDzW/
 Qv1s4O5yezqNsKZhqXMOSCXHxhODPjwNYM/1TZ+zohajwGZJulK5ASGHMPFO1Tfoiy
 6M3gd3nf7uATlmFCmqoMI/SvVGyTg5RC37x2IbzPn4qmfXh3/CZ6FBfoMrIFUANGw3
 mMvSE4dbTNXDnxzxwNKB8RZZkHnzYc3nu5YsakhNr4G1KvHK8hWNQuIaR6SKugHrix
 /aMlACJzvYtk9vqGtyVozc9Mf3WKsVuIqnHpFSiLNyMJM6VXiEZZ9HFn67VEjeHNif
 RWj/uI+QkfF2Q==
Received: from ru20arcgnu1.internal.synopsys.com
 (ru20arcgnu1.internal.synopsys.com [10.121.9.48])
 by mailhost.synopsys.com (Postfix) with ESMTP id 1D905A0064;
 Fri, 31 Jan 2020 15:25:40 +0000 (UTC)
From: Nikita Sobolev <Nikita.Sobolev@synopsys.com>
To: Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org
Subject: [PATCH] Kernel selftests: tpm2: check for tpm support
Date: Fri, 31 Jan 2020 18:25:23 +0300
Message-Id: <20200131152523.4442-1-Nikita.Sobolev@synopsys.com>
X-Mailer: git-send-email 2.16.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200131_072552_758559_43BA0D6E 
X-CRM114-Status: UNSURE (   9.37  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: Tadeusz Struk <tadeusz.struk@intel.com>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>, linux-kernel@vger.kernel.org,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 Nikita Sobolev <Nikita.Sobolev@synopsys.com>,
 Joey Pabalinas <joeypabalinas@gmail.com>, Petr Vorel <petr.vorel@gmail.com>,
 linux-snps-arc@lists.infradead.org,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

tpm2 tests set fails if there is no /dev/tpm0 and /dev/tpmrm0
supported. Check if these files exist before run and mark test as
skipped in case of absence.

Signed-off-by: Nikita Sobolev <Nikita.Sobolev@synopsys.com>
---
 tools/testing/selftests/tpm2/test_smoke.sh | 13 +++++++++++--
 tools/testing/selftests/tpm2/test_space.sh |  9 ++++++++-
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/tpm2/test_smoke.sh b/tools/testing/selftests/tpm2/test_smoke.sh
index 8155c2ea7ccb..b630c7b5950a 100755
--- a/tools/testing/selftests/tpm2/test_smoke.sh
+++ b/tools/testing/selftests/tpm2/test_smoke.sh
@@ -1,8 +1,17 @@
 #!/bin/bash
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+self.flags = flags
 
-python -m unittest -v tpm2_tests.SmokeTest
-python -m unittest -v tpm2_tests.AsyncTest
+# Kselftest framework requirement - SKIP code is 4.
+ksft_skip=4
+
+
+if [ -f /dev/tpm0 ] ; then
+	python -m unittest -v tpm2_tests.SmokeTest
+	python -m unittest -v tpm2_tests.AsyncTest
+else
+	exit $ksft_skip
+fi
 
 CLEAR_CMD=$(which tpm2_clear)
 if [ -n $CLEAR_CMD ]; then
diff --git a/tools/testing/selftests/tpm2/test_space.sh b/tools/testing/selftests/tpm2/test_space.sh
index a6f5e346635e..180b469c53b4 100755
--- a/tools/testing/selftests/tpm2/test_space.sh
+++ b/tools/testing/selftests/tpm2/test_space.sh
@@ -1,4 +1,11 @@
 #!/bin/bash
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
 
-python -m unittest -v tpm2_tests.SpaceTest
+# Kselftest framework requirement - SKIP code is 4.
+ksft_skip=4
+
+if [ -f /dev/tpmrm0 ] ; then
+	python -m unittest -v tpm2_tests.SpaceTest
+else
+	exit $ksft_skip
+fi
-- 
2.16.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
