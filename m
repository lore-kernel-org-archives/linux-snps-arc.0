Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47D43C4332F
	for <linux-snps-arc@archiver.kernel.org>; Wed,  2 Nov 2022 18:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GXQRSUbh70Qfs7+Vi8xYRw2RkOCWTAyJleiQLtt6LLU=; b=bg8T1qiNFefJOp
	pOwaaxC3/kD/WV47qdgah3+f+lDuSnRUItQlteys1iju5X8q5UqnUGJbV1H5GFRD92Hjj8Fur73gp
	jB4JXtjFTL/IKRbGs0pq53B9Qa2gdnYvcdaMc6ilm20MKy1y0d5+5u1tZDAA2caVw+KA0jwKReksO
	m6IyCy9RpjR9+0MQexfLc0K+18QGA2/BbfWUuU+A2HMOxOIFoR+jWE4Ynum7LEJxJ5slqbTpq6+fm
	CB0cZGqlBl+EXwLMO8QhI1zCGQnr6k0tR7L4QsrQnX+CS/0mwKqVoJwPzmHKGG1fLaPrAgYj1A7Y3
	u//xiD/5O1CyuaSyAdoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqIdW-00D9xA-E8; Wed, 02 Nov 2022 18:38:50 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqIZZ-00D6dX-KC
	for linux-snps-arc@lists.infradead.org; Wed, 02 Nov 2022 18:34:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667414084;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ncRDq/BlJOAFd1lZE2ZJuHKc4OomK+HPZ50zPzXYcKQ=;
	b=MRcjtU1utJ8QnpojAmR3rtXuiuztyxHkg8gYE2DT0DYMIRu2mY7EHj6rrTCbwRkzb5zBhj
	OuPuV8tXjm6yHb9mQOlmuZ2cqXhRF/FUK8ePWLc65MOT2b7r1Fs3OnvjLm2YwOa9uJS89I
	f9pv1RWjp5bx2RcgnoA3m+xw5NhJ/4o=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-364-AiIkeF1kMuigjvDlMBkRZw-1; Wed, 02 Nov 2022 14:34:36 -0400
X-MC-Unique: AiIkeF1kMuigjvDlMBkRZw-1
Received: by mail-qv1-f69.google.com with SMTP id ob9-20020a0562142f8900b004bba5363ad9so10139256qvb.8
        for <linux-snps-arc@lists.infradead.org>; Wed, 02 Nov 2022 11:34:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ncRDq/BlJOAFd1lZE2ZJuHKc4OomK+HPZ50zPzXYcKQ=;
        b=CKy0zUTNIA0V+20dgk94fUiKrh7cuDwqeDOOQqlqueYrEowJgqDU1yq22eMx5tyHRu
         sP8Ap1OfU+JLPEJWcqo5GGRKnHbBJejDxF4YnTZ4YRdEpWKF1ow/CJenoiE+vrIxv7yk
         fVvFQ1lNxIzXKkTlK9YTPY/vw2dnh+rqt2q5gf7Z4l1aauy2NJ8rwbufbtviOmitAAWg
         KXeUQIq1DaqvbTquX2JiyKzy7iTASAnbNLyRTleiOx858Ej9EkDcZmvm6IiihqCozA5Z
         V8QRTpiZfPMft4ep9bpazNGGGUnTmkKXS2kP7Ke5/YTFEEvL3qWRGp6P5SXFfLnKRPYp
         SBZQ==
X-Gm-Message-State: ACrzQf2dpBALa7SyW3KMEjQnTY47SgJ9AvgUBgxfLweCIuDBcq9idSo+
	rkTaSR8mi847gQRmvorZOOhDrZwp4jayOtUwsH/eBkmEqytFIfHrAA6DgG8xJa7KS7T917jOoVy
	f81iPdJfzQpnZAacItiuJQhAToUkPaP1Q
X-Received: by 2002:a05:622a:248c:b0:3a5:15f9:57a5 with SMTP id cn12-20020a05622a248c00b003a515f957a5mr18914924qtb.48.1667414075616;
        Wed, 02 Nov 2022 11:34:35 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4FNihlWG52eEaddlVJ4IcxN5GuBU/ct7sDYakGhS8G9lm88SJZYPQReqCWBc6NZ/CtMAHrgg==
X-Received: by 2002:a05:622a:248c:b0:3a5:15f9:57a5 with SMTP id cn12-20020a05622a248c00b003a515f957a5mr18914895qtb.48.1667414075423;
        Wed, 02 Nov 2022 11:34:35 -0700 (PDT)
Received: from vschneid.remote.csb ([149.71.65.94])
        by smtp.gmail.com with ESMTPSA id w187-20020a3794c4000000b006eed47a1a1esm8757820qkd.134.2022.11.02.11.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 11:34:34 -0700 (PDT)
From: Valentin Schneider <vschneid@redhat.com>
To: linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	linux-ia64@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	openrisc@lists.librecores.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-xtensa@linux-xtensa.org,
	x86@kernel.org
Cc: "Paul E. McKenney" <paulmck@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Juri Lelli <juri.lelli@redhat.com>,
	Daniel Bristot de Oliveira <bristot@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Marc Zyngier <maz@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Nicholas Piggin <npiggin@gmail.com>,
	Guo Ren <guoren@kernel.org>,
	"David S. Miller" <davem@davemloft.net>
Subject: [RFC PATCH v2 7/8] smp: reword smp call IPI comment
Date: Wed,  2 Nov 2022 18:33:35 +0000
Message-Id: <20221102183336.3120536-6-vschneid@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221102182949.3119584-1-vschneid@redhat.com>
References: <20221102182949.3119584-1-vschneid@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_113445_773700_F2467076 
X-CRM114-Status: GOOD (  15.85  )
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

Accessing the call_single_queue hasn't involved a spinlock since 2014:

  6897fc22ea01 ("kernel: use lockless list for smp_call_function_single")

The llist operations (namely cmpxchg() and xchg()) provide similar ordering
guarantees, update the comment to lessen confusion.

Signed-off-by: Valentin Schneider <vschneid@redhat.com>
---
 kernel/smp.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/kernel/smp.c b/kernel/smp.c
index 44fa4b9b1f46b..b96579fe08f09 100644
--- a/kernel/smp.c
+++ b/kernel/smp.c
@@ -503,9 +503,10 @@ void __smp_call_single_queue(int cpu, struct llist_node *node)
 #endif
 
 	/*
-	 * The list addition should be visible before sending the IPI
-	 * handler locks the list to pull the entry off it because of
-	 * normal cache coherency rules implied by spinlocks.
+	 * The list addition should be visible to the target CPU when it pops
+	 * the head of the list to pull the entry off it in the IPI handler
+	 * because of normal cache coherency rules implied by the underlying
+	 * llist ops.
 	 *
 	 * If IPIs can go out of order to the cache coherency protocol
 	 * in an architecture, sufficient synchronisation should be added
-- 
2.31.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
