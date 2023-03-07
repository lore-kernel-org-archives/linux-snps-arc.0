Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF3FC678D4
	for <linux-snps-arc@archiver.kernel.org>; Tue,  7 Mar 2023 15:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g0nF4ySFqIxHwAOuKbVJZHHa3ewyYXNBdMwfDEbYrdo=; b=C3oqm64IkUmM5k
	HlDLNOhcvapjQtDUFqyyqyq0UgEak1Lj0++qunqTsqCalKzyVhjiNGl4cpz/wZ5AtClveEXts/leq
	HHntgVVENstQPj5JKR35fJqUj4o3vaCyQ9JUkm5aZ3xnLyMqU3FQ8ggMUjpApYgEAQCMkAMnSfCMM
	oqZJn/EdYQnvqPFssQYpQaNn/o/BabbtDZFuvezUTXYsIOzqKvZTSNZwIkMgztZpkFiocei7MHkRi
	XZhUby7Ow+983QHR78IGcs6RbrPCO80tIbb6q3kQTLI48blY9gp5ra5Kh8Ysj3ZdJGqBnJ0TB240v
	kH/x8TF6zxZKgn56PzlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZYzX-0018NS-9O; Tue, 07 Mar 2023 15:12:39 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZYRC-000rMQ-Em
	for linux-snps-arc@lists.infradead.org; Tue, 07 Mar 2023 14:37:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678199829;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QbSxuBYwyBhZhp7hgOeOy88U7e5YyI7vjVO9jj/5+zE=;
	b=YVQ5sIbU3PSHh9H92BNl/iDHZynMEgwfsBCy9pzUdt58quSiy+3guy5TBwn7tGJjJopAKJ
	4quKa1pl5GUPU7PZKhWUwUpWrB+GQL/qglVLIC9S4mEZWl7rTNjWq9Se/F3CmADt82AMVv
	b8mNQUy92ztcNDKrhqLeFJujWqi7Q/M=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-435-w0wR9ByeM4e_eV67Jzxu2w-1; Tue, 07 Mar 2023 09:37:04 -0500
X-MC-Unique: w0wR9ByeM4e_eV67Jzxu2w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9B173280AA28;
	Tue,  7 Mar 2023 14:37:02 +0000 (UTC)
Received: from vschneid.remote.csb (unknown [10.33.37.13])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8475A40AE20A;
	Tue,  7 Mar 2023 14:36:58 +0000 (UTC)
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
Subject: [PATCH v5 6/7] smp: reword smp call IPI comment
Date: Tue,  7 Mar 2023 14:35:57 +0000
Message-Id: <20230307143558.294354-7-vschneid@redhat.com>
In-Reply-To: <20230307143558.294354-1-vschneid@redhat.com>
References: <20230307143558.294354-1-vschneid@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_063710_603624_6BE5C601 
X-CRM114-Status: GOOD (  16.49  )
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
index 93b4386cd3096..821b5986721ac 100644
--- a/kernel/smp.c
+++ b/kernel/smp.c
@@ -495,9 +495,10 @@ void __smp_call_single_queue(int cpu, struct llist_node *node)
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
