Return-Path: <SRS0=yL/A=OY=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7275EC433EF
	for <linux-snps-arc@archiver.kernel.org>; Mon,  4 Oct 2021 09:36:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44F4360F5D
	for <linux-snps-arc@archiver.kernel.org>; Mon,  4 Oct 2021 09:36:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 44F4360F5D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EgMfWWkH3CFgRTrValv4ICBMlHEH1QBrq5Q6ZT4qgP8=; b=Kbj7V2Xl0B1QQp
	HZ43LMjcV7zMU6NDNQFtJXQYc88/GL5NV53GMQxDLgIxlmHd/wpjClIDkHQrgluFOE6Z29mqn0mUA
	0dqN5Pxv1CV0QQONI9dge/h+ZrVVZ9oxqo9qv+jq8hE7QY6DJi7na84aunckqkKQaqBH/94p8sUIr
	IeKBma9lcPhuLV2nDsbkCRXLxUbNAVTd2kscMjtKYCkO93JHKtfktSsr0tX+RomGed4moFORIMfmr
	tqvhW7OQNvwOYVrfgUDWIm0yURXQUk5k8DUHE5QiKD6xrGsgAcHWcjgSwh3z+7vCP9ylhpWLVOzsr
	MpsHepWcUEgbeDMNL2LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXKOf-005n4a-Nv; Mon, 04 Oct 2021 09:36:33 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXKOb-005n1Z-1e
 for linux-snps-arc@lists.infradead.org; Mon, 04 Oct 2021 09:36:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633340188;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=76mZg+E3RG88YQfrtX8VX08A90LrtCPW8/rlR6y2h7s=;
 b=VHQAraMMxRh0YYoj3ojXO+vEffXjrTyVbXlq+F81iQcCc6JvqQhDsidZsBVNZdTUPsofUR
 Yku0uOF17vQl4C1It6gee25WXvc/Gldz/Qong+JUYjeRON03cDsVkoi+dGd/YwKdVqmoU9
 RHFyKVXszO8iCtg2JNAQ9aVxcBnz1IY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-gp1WCNiTMQ-PZ7SoqHQEqg-1; Mon, 04 Oct 2021 05:36:24 -0400
X-MC-Unique: gp1WCNiTMQ-PZ7SoqHQEqg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0BF1F36317;
 Mon,  4 Oct 2021 09:36:22 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.194.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1C73910013C1;
 Mon,  4 Oct 2021 09:36:14 +0000 (UTC)
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
Subject: [PATCH v2 1/5] mm/memory_hotplug: handle memblock_add_node() failures
 in add_memory_resource()
Date: Mon,  4 Oct 2021 11:36:01 +0200
Message-Id: <20211004093605.5830-2-david@redhat.com>
In-Reply-To: <20211004093605.5830-1-david@redhat.com>
References: <20211004093605.5830-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211004_023629_224794_38366235 
X-CRM114-Status: GOOD (  13.13  )
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

If memblock_add_node() fails, we're most probably running out of memory.
While this is unlikely to happen, it can happen and having memory added
without a memblock can be problematic for architectures that use
memblock to detect valid memory. Let's fail in a nice way instead of
silently ignoring the error.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/memory_hotplug.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 9fd0be32a281..917b3528636d 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1384,8 +1384,11 @@ int __ref add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
 
 	mem_hotplug_begin();
 
-	if (IS_ENABLED(CONFIG_ARCH_KEEP_MEMBLOCK))
-		memblock_add_node(start, size, nid);
+	if (IS_ENABLED(CONFIG_ARCH_KEEP_MEMBLOCK)) {
+		ret = memblock_add_node(start, size, nid);
+		if (ret)
+			goto error_mem_hotplug_end;
+	}
 
 	ret = __try_online_node(nid, false);
 	if (ret < 0)
@@ -1458,6 +1461,7 @@ int __ref add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
 		rollback_node_hotadd(nid);
 	if (IS_ENABLED(CONFIG_ARCH_KEEP_MEMBLOCK))
 		memblock_remove(start, size);
+error_mem_hotplug_end:
 	mem_hotplug_done();
 	return ret;
 }
-- 
2.31.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
