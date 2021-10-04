Return-Path: <SRS0=yL/A=OY=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E172C433FE
	for <linux-snps-arc@archiver.kernel.org>; Mon,  4 Oct 2021 09:36:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FEF5610CE
	for <linux-snps-arc@archiver.kernel.org>; Mon,  4 Oct 2021 09:36:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5FEF5610CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EsRP/L2Ur9YnxzKYqfVaQvKr080oirtuAj/wY6zS0s4=; b=jLDOAnwRVlypJm
	44s4785cbjIyMHKs935opuZvhSdPtR4Pq4MefIyodq9JFXTijIlCaKLCPCBTn9hEHXBvykRlPr/N+
	IKF1OsVDAo+2vbvjQSCQCGPnbN9VZrcu0Vf37Xulaeqw+mdXCaBHhuvPPcMM+EenXqsXRLQx0quiF
	ZZ9VZbfFILDThtI7p8wQn3cxLBR4EM2h4TX6z1c7rz3/35aG/oNPYCQYOzxUyaIY4vKXliGxMl60u
	CcPIT4XvUN8B+KPlN0YdrsI5hfsf9TPXuvu6nvleQ4fVkuuZSflmpjlmY3UgB2ZK0zjwFTxNxKVKm
	jzbLULITLQFAc16hl9MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXKOh-005n5u-Um; Mon, 04 Oct 2021 09:36:35 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXKOf-005n3Y-9L
 for linux-snps-arc@lists.infradead.org; Mon, 04 Oct 2021 09:36:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633340191;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kO8zp8Wu6+ZvuXVBX/LGAottNCd0eE/ew4t9MBAkcjM=;
 b=d1pgDJKtYUbBEY3bgDc17KrsDiFJWwBPbm0Lv/qs7I9YLMPePD1clSFMkqtWWXqv9fbC3s
 CxYbpU7emFTrofJ2IFC223+LyBqRHCOZIA5kfhUJ83Y8ROPCctFI8l5s13TtS5fnzHBkqa
 cL/BeHixuV5HZrJwdNfBVT+9OfCBHEU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-OGpOPFWFNk6D_1xBVHXnQA-1; Mon, 04 Oct 2021 05:36:30 -0400
X-MC-Unique: OGpOPFWFNk6D_1xBVHXnQA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF7541922962;
 Mon,  4 Oct 2021 09:36:27 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.194.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3C62410013C1;
 Mon,  4 Oct 2021 09:36:22 +0000 (UTC)
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
Subject: [PATCH v2 2/5] memblock: improve MEMBLOCK_HOTPLUG documentation
Date: Mon,  4 Oct 2021 11:36:02 +0200
Message-Id: <20211004093605.5830-3-david@redhat.com>
In-Reply-To: <20211004093605.5830-1-david@redhat.com>
References: <20211004093605.5830-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211004_023633_466055_B52A265D 
X-CRM114-Status: GOOD (  16.36  )
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

The description of MEMBLOCK_HOTPLUG is currently short and consequently
misleading: we're actually dealing with a memory region that might get
hotunplugged later (i.e., the platform+firmware supports it), yet it is
indicated in the firmware-provided memory map as system ram that will just
get used by the system for any purpose when not taking special care. The
firmware marked this memory region as a hot(un)plugged (e.g., hotplugged
before reboot), implying that it might get hotunplugged again later.

Whether we consider this information depends on the "movable_node" kernel
commandline parameter: only with "movable_node" set, we'll try keeping
this memory hotunpluggable, for example, by not serving early allocations
from this memory region and by letting the buddy manage it using the
ZONE_MOVABLE.

Let's make this clearer by extending the documentation.

Note: kexec *has to* indicate this memory to the second kernel. With
"movable_node" set, we don't want to place kexec-images on this memory.
Without "movable_node" set, we don't care and can place kexec-images on
this memory. In both cases, after successful memory hotunplug, kexec has to
be re-armed to update the memory map for the second kernel and to place the
kexec-images somewhere else.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/memblock.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/linux/memblock.h b/include/linux/memblock.h
index 34de69b3b8ba..4ee8dd2d63a7 100644
--- a/include/linux/memblock.h
+++ b/include/linux/memblock.h
@@ -28,7 +28,11 @@ extern unsigned long long max_possible_pfn;
 /**
  * enum memblock_flags - definition of memory region attributes
  * @MEMBLOCK_NONE: no special request
- * @MEMBLOCK_HOTPLUG: hotpluggable region
+ * @MEMBLOCK_HOTPLUG: memory region indicated in the firmware-provided memory
+ * map during early boot as hot(un)pluggable system RAM (e.g., memory range
+ * that might get hotunplugged later). With "movable_node" set on the kernel
+ * commandline, try keeping this memory region hotunpluggable. Does not apply
+ * to memblocks added ("hotplugged") after early boot.
  * @MEMBLOCK_MIRROR: mirrored region
  * @MEMBLOCK_NOMAP: don't add to kernel direct mapping and treat as
  * reserved in the memory map; refer to memblock_mark_nomap() description
-- 
2.31.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
