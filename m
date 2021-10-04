Return-Path: <SRS0=yL/A=OY=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A88AAC433F5
	for <linux-snps-arc@archiver.kernel.org>; Mon,  4 Oct 2021 09:36:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 659B261248
	for <linux-snps-arc@archiver.kernel.org>; Mon,  4 Oct 2021 09:36:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 659B261248
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pBwz+jRehjWjgmwd8KYkV3pKM1/sxoEBtoEhiFbZ0gY=; b=a8P0OcNQ38eUJZ
	sHNDIFDm7qnsNwM0SzzVg0hKPUgzU41gi8hqxu52QS93ZeKly/qSv0mZcMiV9FiWrVA97M6uNjzVU
	Kp4yVPgG1he1nnzc9FD0/3eEnIo7wA2gW0N1wrA13Lk7QBFHvcQVLVFvirO2fv+rLMuKsEXpo10Xs
	vFejFcvJpLpH7UM6jwOhZ9hXcYdjy/lOwir2SRM55plkBCovs4FvFIo1rVtCogOvDvGP9CV2BK1Ve
	Jxylwqv9vnAT+dHm8DHyAa1c5fa9TU18haWhuAIElZHRJY2yvzfNBvgGwm4JhA8633D6b2gWRnS69
	wE6kYh+H0lzCu/Jmr35Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXKOZ-005n1L-VB; Mon, 04 Oct 2021 09:36:27 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXKOT-005mzE-LK
 for linux-snps-arc@lists.infradead.org; Mon, 04 Oct 2021 09:36:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633340180;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=hlABN2UfX8mmg4ng0oI/HDWFcaKFWagGNJM8HwtDihg=;
 b=F7YrK3RBAgnWJ3QDhU3GrNHz022r7yRiR2Glygvs2++J8onyr9icyN6wMidHk+HWb5py3b
 o+oWaQyjYZB6Z8s4cOhi7GnIErun1YJ1xUvoFSTNAnGzG/DuTykOKL4I1+wQ2RF4GCHble
 rkUvMMqMu2pa56xQUZZTJ79lDJFfo4A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-560-MDZ8qFBKP2Whbkrt_JF4zg-1; Mon, 04 Oct 2021 05:36:17 -0400
X-MC-Unique: MDZ8qFBKP2Whbkrt_JF4zg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B143E1006AA4;
 Mon,  4 Oct 2021 09:36:14 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.194.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 098A9100763D;
 Mon,  4 Oct 2021 09:36:06 +0000 (UTC)
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
Subject: [PATCH v2 0/5] mm/memory_hotplug: full support for
 add_memory_driver_managed() with CONFIG_ARCH_KEEP_MEMBLOCK
Date: Mon,  4 Oct 2021 11:36:00 +0200
Message-Id: <20211004093605.5830-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211004_023621_787478_1D5989DD 
X-CRM114-Status: GOOD (  11.61  )
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

Architectures that require CONFIG_ARCH_KEEP_MEMBLOCK=y, such as arm64,
don't cleanly support add_memory_driver_managed() yet. Most prominently,
kexec_file can still end up placing kexec images on such driver-managed
memory, resulting in undesired behavior, for example, having kexec images
located on memory not part of the firmware-provided memory map.

Teaching kexec to not place images on driver-managed memory is especially
relevant for virtio-mem. Details can be found in commit 7b7b27214bba
("mm/memory_hotplug: introduce add_memory_driver_managed()").

Extend memblock with a new flag and set it from memory hotplug code
when applicable. This is required to fully support virtio-mem on
arm64, making also kexec_file behave like on x86-64.

v1 -> v2:
- "memblock: improve MEMBLOCK_HOTPLUG documentation"
-- Added
- "memblock: add MEMBLOCK_DRIVER_MANAGED to mimic
   IORESOURCE_SYSRAM_DRIVER_MANAGED"
-- Improve documentation of MEMBLOCK_DRIVER_MANAGED
- Refine patch descriptions

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Jianyong Wu <Jianyong.Wu@arm.com>
Cc: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Cc: Vineet Gupta <vgupta@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Heiko Carstens <hca@linux.ibm.com>
Cc: Vasily Gorbik <gor@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Eric Biederman <ebiederm@xmission.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: linux-snps-arc@lists.infradead.org
Cc: linux-ia64@vger.kernel.org
Cc: linux-m68k@lists.linux-m68k.org
Cc: linux-mips@vger.kernel.org
Cc: linux-s390@vger.kernel.org
Cc: linux-mm@kvack.org
Cc: kexec@lists.infradead.org

David Hildenbrand (5):
  mm/memory_hotplug: handle memblock_add_node() failures in
    add_memory_resource()
  memblock: improve MEMBLOCK_HOTPLUG documentation
  memblock: allow to specify flags with memblock_add_node()
  memblock: add MEMBLOCK_DRIVER_MANAGED to mimic
    IORESOURCE_SYSRAM_DRIVER_MANAGED
  mm/memory_hotplug: indicate MEMBLOCK_DRIVER_MANAGED with
    IORESOURCE_SYSRAM_DRIVER_MANAGED

 arch/arc/mm/init.c               |  4 ++--
 arch/ia64/mm/contig.c            |  2 +-
 arch/ia64/mm/init.c              |  2 +-
 arch/m68k/mm/mcfmmu.c            |  3 ++-
 arch/m68k/mm/motorola.c          |  6 ++++--
 arch/mips/loongson64/init.c      |  4 +++-
 arch/mips/sgi-ip27/ip27-memory.c |  3 ++-
 arch/s390/kernel/setup.c         |  3 ++-
 include/linux/memblock.h         | 25 +++++++++++++++++++++----
 include/linux/mm.h               |  2 +-
 kernel/kexec_file.c              |  5 +++++
 mm/memblock.c                    | 13 +++++++++----
 mm/memory_hotplug.c              | 11 +++++++++--
 13 files changed, 62 insertions(+), 21 deletions(-)


base-commit: 9e1ff307c779ce1f0f810c7ecce3d95bbae40896
-- 
2.31.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
