Return-Path: <SRS0=q9SV=OR=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1CDAC4332F
	for <linux-snps-arc@archiver.kernel.org>; Mon, 27 Sep 2021 15:06:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7D456101A
	for <linux-snps-arc@archiver.kernel.org>; Mon, 27 Sep 2021 15:06:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B7D456101A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vp3uFi1us1mvrk4aWPr5SL1h5Qfe97IPKjZ2I81BAyc=; b=FtvCRviTpF3+6g
	dB5JWh4AGF8SeYdLkovcT0W292AfKym2M5THC43pcYcQ7BzoTRU8KS0Ca6TmVA5qfAWC1TilYLYIH
	+N1Gtii6G8zMKG6U7CXcbWM7my8lRo60Rua8Fy0N2pQbn+DnSMsyGyEPqWgvcIhwDK9tHPs7WbNqI
	J1S/JHY/a8w+JWugIrIZYQszsKJfBKhD7uJS9b/8xPCWkydjF7LHMHRWcGVo5Fn0pf6oUBdZhiEUR
	pt1xOE2od5wpwz7ZtVI4gWkQh0qmyBnzJ+37tPrE5AqAm7+mVLlL0oBM/GsxHlHlWo33Mv9UZAjrO
	l/Nus73xGFrlpBzH/euQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUsCj-0031nE-0q; Mon, 27 Sep 2021 15:06:05 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUsCe-0031i1-CS
 for linux-snps-arc@lists.infradead.org; Mon, 27 Sep 2021 15:06:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632755159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=65rZyeBSOs3Q4+ni7NpmP4KZICyvZvVHfeOoz1UxwGM=;
 b=OzT+W+J4JlfKRravfxd2gF4S6H8EckCJvHRJQdgeubXkW1eOOtjip7m4nfbTu8Rq/lloUO
 btFAx/dOLPtigLlVITxGrAUwYPJDMigOgJ4yabbP4wxUNXUHLb4Zn7+H4KkmvN9a21MEwM
 apEfLApiuAuh+kA8U2Dw6u6emUCTnwo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-yoNh7RG9PGqU9jwrtGg9jA-1; Mon, 27 Sep 2021 11:05:58 -0400
X-MC-Unique: yoNh7RG9PGqU9jwrtGg9jA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8597884A5F9;
 Mon, 27 Sep 2021 15:05:55 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.193.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3739A60C13;
 Mon, 27 Sep 2021 15:05:51 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: David Hildenbrand <david@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Michal Hocko <mhocko@suse.com>, Oscar Salvador <osalvador@suse.de>,
 Jianyong Wu <Jianyong.Wu@arm.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Vineet Gupta <vgupta@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Eric Biederman <ebiederm@xmission.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-snps-arc@lists.infradead.org, linux-ia64@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-mm@kvack.org, kexec@lists.infradead.org
Subject: [PATCH v1 4/4] mm/memory_hotplug: indicate MEMBLOCK_DRIVER_MANAGED
 with IORESOURCE_SYSRAM_DRIVER_MANAGED
Date: Mon, 27 Sep 2021 17:05:18 +0200
Message-Id: <20210927150518.8607-5-david@redhat.com>
In-Reply-To: <20210927150518.8607-1-david@redhat.com>
References: <20210927150518.8607-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210927_080600_529251_31A545FE 
X-CRM114-Status: GOOD (  13.66  )
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

Let's communicate driver-managed regions to memblock, to properly
teach kexec_file with CONFIG_ARCH_KEEP_MEMBLOCK to not place images on
these memory regions.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/memory_hotplug.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 5f873e7f5b29..6d90818d4ce8 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1357,6 +1357,7 @@ bool mhp_supports_memmap_on_memory(unsigned long size)
 int __ref add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
 {
 	struct mhp_params params = { .pgprot = pgprot_mhp(PAGE_KERNEL) };
+	enum memblock_flags memblock_flags = MEMBLOCK_NONE;
 	struct vmem_altmap mhp_altmap = {};
 	struct memory_group *group = NULL;
 	u64 start, size;
@@ -1385,7 +1386,9 @@ int __ref add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
 	mem_hotplug_begin();
 
 	if (IS_ENABLED(CONFIG_ARCH_KEEP_MEMBLOCK)) {
-		ret = memblock_add_node(start, size, nid, MEMBLOCK_NONE);
+		if (res->flags & IORESOURCE_SYSRAM_DRIVER_MANAGED)
+			memblock_flags = MEMBLOCK_DRIVER_MANAGED;
+		ret = memblock_add_node(start, size, nid, memblock_flags);
 		if (ret)
 			goto error_mem_hotplug_end;
 	}
-- 
2.31.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
