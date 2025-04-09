Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D1FEC369A4
	for <linux-snps-arc@archiver.kernel.org>; Wed,  9 Apr 2025 17:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sreoQDMI2ko9RdqBj5AuJ2zvuEix1F8tXntfcJ0fbjk=; b=xMfSoN9q+vfQmx
	8v7m4JBQGnrm3oQd/ty0gAwGlPdYZ9ClchnvOh1t+iA5jL552QLdun4PP0LeZwRNXSZ8WADN5kRH0
	5cVYcw78FBTJbNMdaBjhXFDDnE/IYpj7MLnVGkfnwqddvX0rxqrsNe1P7+/TdZIGHVCPKX/l6CD2K
	vychrZLdQ8SXb1FW4iXkjmQSux5VXl2/vttyKoiG+cpROPB+VaN5goP+USAznuLSW3NRNjQSj5xp1
	ce9J0+wjkGyhfrjtnN2L97Yt6pW0Z4jmYxTpUdPO8aC7tTxoVQEEOhD5u/jfg/MEgwt6iy6CEfEWR
	0ZxkOf83XFYkX+NJP/Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Yyv-000000080Va-3Wta;
	Wed, 09 Apr 2025 17:12:57 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2YxR-0000000809w-2QeU
	for linux-snps-arc@lists.infradead.org;
	Wed, 09 Apr 2025 17:11:26 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-226185948ffso74693625ad.0
        for <linux-snps-arc@lists.infradead.org>; Wed, 09 Apr 2025 10:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744218683; x=1744823483; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ljY6ET4Gs1ZLwfHwkM4Df+UpKJ+L4lbBmw0jsIJyzxc=;
        b=M5LDmagAzXX9eCxuxag5J8VfJjz5exp2zJNqbyIprWPRCF6Dj/HFsjmweDra+Unin/
         6ZoZwYK3gsB16OZHxF8g/UCiDDqvgE353laDFTFurghH/l3a0bpUzdrVnpNiZ4Ps+5n4
         H9qg9/HxP2P8ivVDELZgm3Axa/86MqJLZwKd6zGdM/TJAt/fRcXe/EzkXoelpgRONNLy
         irZYCg6HuxmG4NbBhDaRUH2ZS8UBI1Xf7YjXPcdUgRtdY9uY7eE7lOtPURn2+YwMb16F
         NxBe0sYVnTJ18s/39cpvBXS/nw8tHRt4rlc2uR8VysJXYgqcZefUpXHE7UQDmTVUa3Ck
         0U1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744218683; x=1744823483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ljY6ET4Gs1ZLwfHwkM4Df+UpKJ+L4lbBmw0jsIJyzxc=;
        b=k2QahvWKd+/yRplrvBhOQoE0nJvWiY3Bxx2Rp3PZbLP5kL0i1P6pkeaapsIXkR0bEM
         u2EUanvvq/L4BSsn5HCvyWKL/1Fctbm1vM68+9mCz2pFxb52gCehzJ2i5qsKQ580VQdQ
         zU2XAX35DDFf0PE7IySxCKI3jlvU1i5Cgpvdu0DKdDdaLN5zwXtbMnXW8gMitLjBWoWH
         zuriH3cLPDt9n8zPyWgZbtFsLoMN8RabeKfJch8RJzAtCYfZ08x2+bJJWkTOuvmpcHk6
         jtyKTfC51NHUF2VVP5UMXd4usNcLC3Z/kcF7Nm1hxtQcjgDiNer1RV9bMuqi1HIfFLaF
         nDOQ==
X-Gm-Message-State: AOJu0YxPc1sZVOW7Eno2r71+CgeRtX5cnvZW5DYTNqwTlzJ+1e2U0fU6
	mge20gr9x4myi4hl5oO7vvU2ipjmLPdzhYj7jHR8kpiN/2XdOMwLXmFcAw==
X-Gm-Gg: ASbGncsmXFcqfbDAM4Px3hqtaWZPTrzyCtHne80acPuDE8wKsm7Akw4O1MHvWQ6cIKI
	E2kh3JM5Dc2GmTeXmo4bB1dFfePnG+X7oJifUahvlZD4uLrkr6x+OHYjXSHDXhFli+xBwK0oT7t
	OssJ6HKgMAt++xL8XkV9J4s5gvEwPruZSUeC/D/usDS+QYhImxirZ0ZzxzGwVsf5w46K/fwnR9s
	PVx8gwxc+3QFfq9kTGtEO/HjiCc2kvH8Bk18tZTZm/iiTjJr+f7jwrI7QKUO7rxn9/nGskxVpMW
	s3HPHiyyAD0178DdkrWLyjtnNhDQIGuD/4eXBmo3mdBd/w==
X-Google-Smtp-Source: AGHT+IFN4lnjAG2pC86AigCdhe18+t7czfJrLdV8seqNXHVt3C/GgPo7KXAmU0xU0Lhj1qng6dfQLg==
X-Received: by 2002:a17:902:e80f:b0:220:ff3f:6cc0 with SMTP id d9443c01a7336-22ac2a1df0bmr56410235ad.38.1744218683140;
        Wed, 09 Apr 2025 10:11:23 -0700 (PDT)
Received: from eleanor-wkdl.. ([140.116.96.203])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b8bcd7sm14659015ad.88.2025.04.09.10.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 10:11:22 -0700 (PDT)
From: Yu-Chun Lin <eleanor15x@gmail.com>
To: vgupta@kernel.org
Cc: linux-snps-arc@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jserv@ccns.ncku.edu.tw,
	visitorckw@gmail.com,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH] ARC: unwind: Use built-in sort swap to reduce code size and improve performance
Date: Thu, 10 Apr 2025 01:11:16 +0800
Message-ID: <20250409171116.550665-1-eleanor15x@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_101125_616131_66A83909 
X-CRM114-Status: UNSURE (   8.95  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

The custom swap function used in sort() was identical to the default
built-in sort swap. Remove the custom swap function and passes NULL to
sort(), allowing it to use the default swap function.

This change reduces code size and improves performance, particularly when
CONFIG_MITIGATION_RETPOLINE is enabled. With RETPOLINE mitigation, indirect
function calls incur significant overhead, and using the default swap
function avoids this cost.

$ ./scripts/bloat-o-meter ./unwind.o.old ./unwind.o.new
add/remove: 0/1 grow/shrink: 0/1 up/down: 0/-22 (-22)
Function                                     old     new   delta
init_unwind_hdr.constprop                    544     540      -4
swap_eh_frame_hdr_table_entries               18       -     -18
Total: Before=4410, After=4388, chg -0.50%

Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
---
Compile test only

 arch/arc/kernel/unwind.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/arch/arc/kernel/unwind.c b/arch/arc/kernel/unwind.c
index d8969dab12d4..789cfb9ea14e 100644
--- a/arch/arc/kernel/unwind.c
+++ b/arch/arc/kernel/unwind.c
@@ -241,15 +241,6 @@ static int cmp_eh_frame_hdr_table_entries(const void *p1, const void *p2)
 	return (e1->start > e2->start) - (e1->start < e2->start);
 }
 
-static void swap_eh_frame_hdr_table_entries(void *p1, void *p2, int size)
-{
-	struct eh_frame_hdr_table_entry *e1 = p1;
-	struct eh_frame_hdr_table_entry *e2 = p2;
-
-	swap(e1->start, e2->start);
-	swap(e1->fde, e2->fde);
-}
-
 static void init_unwind_hdr(struct unwind_table *table,
 			    void *(*alloc) (unsigned long))
 {
@@ -345,7 +336,7 @@ static void init_unwind_hdr(struct unwind_table *table,
 	sort(header->table,
 	     n,
 	     sizeof(*header->table),
-	     cmp_eh_frame_hdr_table_entries, swap_eh_frame_hdr_table_entries);
+	     cmp_eh_frame_hdr_table_entries, NULL);
 
 	table->hdrsz = hdrSize;
 	smp_wmb();
-- 
2.43.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
