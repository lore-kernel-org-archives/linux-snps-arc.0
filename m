Return-Path: <SRS0=VylK=6I=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81807C54FCB
	for <linux-snps-arc@archiver.kernel.org>; Fri, 24 Apr 2020 00:34:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 593CA20724
	for <linux-snps-arc@archiver.kernel.org>; Fri, 24 Apr 2020 00:34:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EXbMG4dQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eTmMEfXZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 593CA20724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9m/PLRiL7OIezusxDNcJ7QFAo2KgBK+JT8qvh/waCEM=; b=EXbMG4dQy+brBU
	5AdTiDmCVEEV9JBaUuxt2R8V1UI8FtVu7PwgFKoWtMabTRcftvyOJcaR3AmlZkrcJL4mk+8qtzN3x
	8X+rMnZGM97k6sSqbJ4EISKNGqwjRLxdHuYV8QLdZhazg4OGJ1ZdNZDyH8wMoNn6iNOnKf9pwrZo+
	O2FrgL4dOibRkcykSYZcylkkJ0qTAAQqSBKX4hDzCnJCq348ZUFYTixSXRTImuoW03L1VmQW/yJyj
	ZC6I0iRlVRRVmJjuCrnU2I5trIriiem4aD0jG4LdlxeGgAckkusRNmkjrKt55sQW/fW7gpeatVzwi
	wtcZKKSJMO+YTpU/S2LA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jRmIO-0001HH-Ed; Fri, 24 Apr 2020 00:34:20 +0000
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRmIK-0001E2-FQ
 for linux-snps-arc@lists.infradead.org; Fri, 24 Apr 2020 00:34:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587688453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n2dWJbdFmIc0aMZ8wHTt5vQhPaXxDdsL9ipp25mLNTI=;
 b=eTmMEfXZAwNiRciPiT/2R4efctZxwysLoOEOVLuaQHYhsgs+1nUUTTIEa+GlWs6BinkhT+
 GfUhNQ8DNAE0D6d0zVFRyY9zaj8EMII0AeZucu/vOBaRqeQ3D6MuU+W7O44hk21hfwtXzR
 wI1FCE8+Cgg4ZzF6/fyI+Gl7eBnY4EU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-PdLkUA6CP7mzy-z_Ga33bw-1; Thu, 23 Apr 2020 20:34:09 -0400
X-MC-Unique: PdLkUA6CP7mzy-z_Ga33bw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 087DD800D24;
 Fri, 24 Apr 2020 00:34:03 +0000 (UTC)
Received: from localhost (ovpn-12-92.pek2.redhat.com [10.72.12.92])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ACFBF1C957;
 Fri, 24 Apr 2020 00:33:58 +0000 (UTC)
Date: Fri, 24 Apr 2020 08:33:56 +0800
From: Baoquan He <bhe@redhat.com>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH 17/21] mm: free_area_init: allow defining max_zone_pfn in
 descending order
Message-ID: <20200424003356.GA10119@MiWiFi-R3L-srv>
References: <20200412194859.12663-1-rppt@kernel.org>
 <20200412194859.12663-18-rppt@kernel.org>
 <20200423025311.GZ4247@MiWiFi-R3L-srv>
 <20200423025720.GA4247@MiWiFi-R3L-srv>
 <20200423055559.GF14260@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200423055559.GF14260@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200423_173416_596587_013CBFC3 
X-CRM114-Status: GOOD (  17.49  )
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Michal Hocko <mhocko@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 linux-csky@vger.kernel.org, linux-parisc@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-riscv@lists.infradead.org, Greg Ungerer <gerg@linux-m68k.org>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-c6x-dev@linux-c6x.org,
 Brian Cain <bcain@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-sh@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Helge Deller <deller@gmx.de>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-arm-kernel@lists.infradead.org, Mark Salter <msalter@redhat.com>,
 Matt Turner <mattst88@gmail.com>, linux-mips@vger.kernel.org,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 linux-alpha@vger.kernel.org, linux-um@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, Tony Luck <tony.luck@intel.com>,
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Stafford Horne <shorne@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 Hoan Tran <Hoan@os.amperecomputing.com>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Nick Hu <nickhu@andestech.com>,
 linux-mm@kvack.org, Vineet Gupta <vgupta@synopsys.com>,
 linux-kernel@vger.kernel.org, openrisc@lists.librecores.org,
 Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 04/23/20 at 08:55am, Mike Rapoport wrote:
> On Thu, Apr 23, 2020 at 10:57:20AM +0800, Baoquan He wrote:
> > On 04/23/20 at 10:53am, Baoquan He wrote:
> > > On 04/12/20 at 10:48pm, Mike Rapoport wrote:
> > > > From: Mike Rapoport <rppt@linux.ibm.com>
> > > > 
> > > > Some architectures (e.g. ARC) have the ZONE_HIGHMEM zone below the
> > > > ZONE_NORMAL. Allowing free_area_init() parse max_zone_pfn array even it is
> > > > sorted in descending order allows using free_area_init() on such
> > > > architectures.
> > > > 
> > > > Add top -> down traversal of max_zone_pfn array in free_area_init() and use
> > > > the latter in ARC node/zone initialization.
> > > 
> > > Or maybe leave ARC as is. The change in this patchset doesn't impact
> > > ARC's handling about zone initialization, leaving it as is can reduce
> > > the complication in implementation of free_area_init(), which is a
> > > common function. So I personally don't see a strong motivation to have
> > > this patch.
> > 
> > OK, seems this patch is prepared to simplify free_area_init_node(), so
> > take back what I said at above.
> > 
> > Then this looks necessary, even though it introduces special case into
> > common function free_area_init().
> 
> The idea is to have a single free_area_init() for all architectures
> without keeping two completely different ways of calculating the zone
> extents.
> Another thing, is that with this we could eventually switch ARC from
> DISCONTIGMEM.

Yeah, I think uniting them into a single free_area_init() is a great
idea. Even though I had been through this patchset, when looked into
each of them, still may forget the detail in later patch :)


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
