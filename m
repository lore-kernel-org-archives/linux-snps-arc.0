Return-Path: <SRS0=mq+M=7B=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC457C433DF
	for <linux-snps-arc@archiver.kernel.org>; Tue, 19 May 2020 12:08:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2CE5207D8
	for <linux-snps-arc@archiver.kernel.org>; Tue, 19 May 2020 12:08:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tnhjzP7U";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="F98P3paC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2CE5207D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=f9/OHYge6/8jqbFCaZAP18u91wlMTyCz1kxnT48Apg0=; b=tnh
	jzP7UFMU5F0FQfnR3SsTiHtwkV3RHX0lvo/mc9qKGD18Xi4BAl7dN33m1b4kuW1Q5HN/44Dz8Hv9o
	kTYptqQtvu5Bk5N7emMZVB3d8AsmaCiYaI+qhG1DdJRJuCilhLVuRKvEDmjtFxrkyrDVXRi5ZL0Du
	/vpqwWTA1qWbNz+BKknJ4ayDF9jFbqze7tnjZ2KKwReUxSwyJAEoxP+N0SWo4BgGFKxtZRPT/27Z4
	9Os9qqR/WYqZSoWdr1912W5lhY+1XcmUuEac0EEd/aoPh8hVfBuO1WX6RPkfJ+lfXUJO+zK/ZAwOE
	xqMlLyD2xF7o4P48/evxzVgjW43TY2w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jb12q-00081Q-Ii; Tue, 19 May 2020 12:08:28 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jb12n-00080P-MR
 for linux-snps-arc@lists.infradead.org; Tue, 19 May 2020 12:08:26 +0000
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 923684050C;
 Tue, 19 May 2020 12:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1589890104; bh=5U+7CPG84Fx9MSC1QbUrTwvZo58qbTd3QcFm6yKsI9w=;
 h=From:To:Cc:Subject:Date:From;
 b=F98P3paCBmltrL9S1Ef3yazrOSEjbRdI26DYsfv2I2yxHmGNMcUsqop8Y7FREVDc3
 Wg/vfiP+OdUO7px0l6hJYguCZuz7vHcWf7j8UzRXi3kBpefueDrNVeOnc3tTIsagbh
 BgZxwOcFZp5+Ydrk7B/h7yPkZzHf4zRWCm44ILp+MLX1u8oJ+rsIzXiVdj7Jm6jOzH
 M0atw6L9jbRYj1i1S/lBuKHrASrNSuNKhe8y3G1RAs5Nwc2fqQwg+Sv+Aw18Rf7DmI
 IUqX7hymMrvVkOXUIZLcGKMRHhpHvdgqiTRADRjVlCv4U6MePR5lfEzTUi5q7soC+6
 Cfzrei8hUv9bQ==
Received: from ru20arcgnu1.internal.synopsys.com
 (ru20arcgnu1.internal.synopsys.com [10.121.9.48])
 by mailhost.synopsys.com (Postfix) with ESMTP id 716F7A005C;
 Tue, 19 May 2020 12:08:20 +0000 (UTC)
From: Nikita Sobolev <Nikita.Sobolev@synopsys.com>
To: Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v2] Kernel selftests: Add check if tpm devices are supported
Date: Tue, 19 May 2020 15:07:43 +0300
Message-Id: <20200519120743.41358-1-Nikita.Sobolev@synopsys.com>
X-Mailer: git-send-email 2.16.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_050825_738384_37FBD827 
X-CRM114-Status: UNSURE (   9.61  )
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
fails, but expected behaviour is skipped test.

Signed-off-by: Nikita Sobolev <Nikita.Sobolev@synopsys.com>
---
Changes for v2:
    - Coding Style cleanup

 tools/testing/selftests/tpm2/test_smoke.sh | 5 +++++
 tools/testing/selftests/tpm2/test_space.sh | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/tools/testing/selftests/tpm2/test_smoke.sh b/tools/testing/selftests/tpm2/test_smoke.sh
index 8155c2ea7ccb..663062701d5a 100755
--- a/tools/testing/selftests/tpm2/test_smoke.sh
+++ b/tools/testing/selftests/tpm2/test_smoke.sh
@@ -1,6 +1,11 @@
 #!/bin/bash
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
 
+# Kselftest framework requirement - SKIP code is 4.
+ksft_skip=4
+
+[ -f /dev/tpm0 ] || exit $ksft_skip
+
 python -m unittest -v tpm2_tests.SmokeTest
 python -m unittest -v tpm2_tests.AsyncTest
 
diff --git a/tools/testing/selftests/tpm2/test_space.sh b/tools/testing/selftests/tpm2/test_space.sh
index a6f5e346635e..36c9d030a1c6 100755
--- a/tools/testing/selftests/tpm2/test_space.sh
+++ b/tools/testing/selftests/tpm2/test_space.sh
@@ -1,4 +1,9 @@
 #!/bin/bash
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
 
+# Kselftest framework requirement - SKIP code is 4.
+ksft_skip=4
+
+[ -f /dev/tpmrm0 ] || exit $ksft_skip
+
 python -m unittest -v tpm2_tests.SpaceTest
-- 
2.16.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
