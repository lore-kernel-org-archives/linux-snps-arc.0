Return-Path: <SRS0=uiT2=7A=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8474AC433DF
	for <linux-snps-arc@archiver.kernel.org>; Mon, 18 May 2020 21:39:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 525DD205CB
	for <linux-snps-arc@archiver.kernel.org>; Mon, 18 May 2020 21:39:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MiLVDljZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="LmW2zV3v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 525DD205CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=bEVSNtMbOj6rlem97xznQCqB4tWyYgerH6YtkH69sxg=; b=MiL
	VDljZ0YuNI5SznIhjR5PMnyjEKM+9qD87o7M36QSw6RJzrp04t5zl0lV7gU2Kj9njUoamtLoKXrzr
	lHHwf+Mla4JDiicJw5vSTT8GnAkMt8FpOeg8tU7bt17BTFS1ppIkxle68i2s6n2lWn9Xsmq920iwm
	AstT07frgpJlW1I8ZKy5QVfkIR1JLC1/pESJBwP0pdGF6kIzftiWt6ADo5logooVhdDOHuXCUhnH8
	u4gLM1XbQFG78mwvMqE9SHe8Any+vlXgfoLMwcIo0CYd+679ArgenZ2YwwAbXjiTQMI9a5XIajpmO
	L5W1hAZdZKTtOudwfxxyCqqzjHIz0Dw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1janUH-0004xd-MV; Mon, 18 May 2020 21:39:53 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1janUC-0004wk-N8
 for linux-snps-arc@lists.infradead.org; Mon, 18 May 2020 21:39:52 +0000
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id ACEBE400B9;
 Mon, 18 May 2020 21:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1589837987; bh=4fUtfqcSwPxDzsZvtjaryhdzMyuy3jPIOnsb1fo4TLE=;
 h=From:To:Cc:Subject:Date:From;
 b=LmW2zV3vqgfLtNGu6lM/+d6Fcr3odAXOx1mpOrnSof+11mW/l74QsXtnwaTKqce9I
 uDfdtMdKwe41oYXsqdZgX2SD0Pt+TD0U10To7eG4t7BDtNNc78sghfN7RvlILSFyJA
 ipdKw2/UhZezG/b79Qf8ZZgqxINOkOsFKCRm7ErvyHtxdlelaiBCOJr6pun9ta1oB8
 oKuFMJbWK5n+KYL5DCdxFI7aI204vdNIL5AJ9AFpSgfGtbwZ8l0LXZIMkFwAtWPClX
 QJ/5xREN94OsXPYjk1KNCgXFNUJxtcYe9bB4UPuZ5U2UHy/tkR6wUDz4FSS8rmy0Jb
 qO/QgEz8NjF2Q==
Received: from ru20arcgnu1.internal.synopsys.com
 (ru20arcgnu1.internal.synopsys.com [10.121.9.48])
 by mailhost.synopsys.com (Postfix) with ESMTP id 2B482A005C;
 Mon, 18 May 2020 21:39:37 +0000 (UTC)
From: Nikita Sobolev <Nikita.Sobolev@synopsys.com>
To: Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org
Subject: [PATCH] Kernel selftests: Add check if tpm devices are supported
Date: Tue, 19 May 2020 00:39:34 +0300
Message-Id: <20200518213934.23156-1-Nikita.Sobolev@synopsys.com>
X-Mailer: git-send-email 2.16.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200518_143948_759435_CAE84A43 
X-CRM114-Status: GOOD (  10.28  )
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
 Jason Gunthorpe <jgg@ziepe.ca>, Nikita Sobolev <Nikita.Sobolev@synopsys.com>,
 Joey Pabalinas <joeypabalinas@gmail.com>, Petr Vorel <petr.vorel@gmail.com>,
 linux-integrity@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Peter Huewe <peterhuewe@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

tpm2 tests set uses /dev/tpm0 and /dev/tpmrm0 without check if they
are available. In case, when these devices are not available test
fails, but expected behaviour is test to be skipped.

Signed-off-by: Nikita Sobolev <Nikita.Sobolev@synopsys.com>
---
 tools/testing/selftests/tpm2/test_smoke.sh | 11 +++++++++--
 tools/testing/selftests/tpm2/test_space.sh |  9 ++++++++-
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/tpm2/test_smoke.sh b/tools/testing/selftests/tpm2/test_smoke.sh
index 8155c2ea7ccb..e55d3e400666 100755
--- a/tools/testing/selftests/tpm2/test_smoke.sh
+++ b/tools/testing/selftests/tpm2/test_smoke.sh
@@ -1,8 +1,15 @@
 #!/bin/bash
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
 
-python -m unittest -v tpm2_tests.SmokeTest
-python -m unittest -v tpm2_tests.AsyncTest
+# Kselftest framework requirement - SKIP code is 4.
+ksft_skip=4
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
