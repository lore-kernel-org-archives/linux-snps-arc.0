Return-Path: <SRS0=vrW9=4Y=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C35ECC10DCE
	for <linux-snps-arc@archiver.kernel.org>; Sat,  7 Mar 2020 01:29:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 958282067C
	for <linux-snps-arc@archiver.kernel.org>; Sat,  7 Mar 2020 01:29:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nkOTyHat"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 958282067C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codesourcery.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=acLoNSkBp2ZOA1ZKi16I6b1LVCIbby5qJko+FYGcF2k=; b=nkOTyHat3f8u4r
	SGPWj3whDBhU//TotGMUmu7QNU6Cw6xNArqUsb5kqec777VzJQCN7aDCyw1SpR9k618qI5+hqTyH4
	gRvGpqGI/7ciKEAwlVVbgyX025tduLpMTtlcbSOMrr1+b18qPU/xvQOcjVZxxRFo82xQfHMRcnZ6T
	nrGQ0xAesKxCazdPBD53FzS9WFISTy7E2IHRqeGt2ZL+W+obpZlkfArRr/8Lszt9LIcxy+kSW/TJw
	cfTUPcCcRkjq7J8OJ3u0ge7XSvxVjWKHacXLMESYrsh9bPgVVUJcbmmdVlIju/belR6BwcTPQ0mv6
	l6UyXuc/Ux0KVwB9WnDg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jAOHJ-00072r-MA; Sat, 07 Mar 2020 01:29:21 +0000
Received: from esa1.mentor.iphmx.com ([68.232.129.153])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jAOHG-00072I-Tr
 for linux-snps-arc@lists.infradead.org; Sat, 07 Mar 2020 01:29:20 +0000
IronPort-SDR: DGuELqSZpOVxvwDFTTM+T/uCN3faMGRxRpkfL/HEOFBoyxD4/n7ovbb4035FfmcRfmb8T/BXcF
 JqXre0Ks/lUSOZIWyIMFS0hTXpXCnzbRTRumQwrU5P3TC+6C+OT555cbi3qFOQPJ58GtqyEJOS
 6TvtHI/qPt8sx3VPicXeYXfXNbUVKMMwzyVzJrxrFhav/cJwJLpHMcxHImzqK2UEUqAWfezPp0
 q4qj2a2C72pzMb8Wkt0cE7LLjaXOXL6no+adJRGI+4mlg+bvWYfhjpaja5chtFQyxALhYe75Pj
 Eak=
X-IronPort-AV: E=Sophos;i="5.70,524,1574150400"; d="scan'208";a="48456055"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
 by esa1.mentor.iphmx.com with ESMTP; 06 Mar 2020 17:29:17 -0800
IronPort-SDR: J6O6zatp6XhIx0+wzeE8rn2ES15aOJ+LS/S2O+huuQTsOFhkDy+KF4LVcLVdwWzIxAggC/A8Si
 O8oT5+/gfMtfIiTDv5Vx01rnpydyd7jSbu1ub7vMEd5i2BUfFhVZkHOI4xlFBfHZdKKAZqMMci
 WZdVoOOdah+Q5RhHNEmBlsQR1bjwmn/WhI9c7ExKqXYfCIK+QtGl5MjrXgkpvZ4izjs01jSEl7
 wKZV0xNskg9rxb90wDYq03m8KpXc9bdkU+M1kxbVYdVJCWSE1j+RZyukRCIYiCycXuw9uaDoG8
 6+U=
Date: Sat, 7 Mar 2020 01:29:12 +0000
From: Joseph Myers <joseph@codesourcery.com>
X-X-Sender: jsm28@digraph.polyomino.org.uk
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH v3 16/17] NEWS: mention ARC port
In-Reply-To: <bb8fb713-1adc-38dc-6f0a-1bacacd4f4e1@synopsys.com>
Message-ID: <alpine.DEB.2.21.2003070128420.26274@digraph.polyomino.org.uk>
References: <20200306182419.13945-1-vgupta@synopsys.com>
 <20200306182419.13945-17-vgupta@synopsys.com>
 <alpine.DEB.2.21.2003070013170.26274@digraph.polyomino.org.uk>
 <8eb3acaa-3d83-a6f9-cf2c-7355b1a83410@synopsys.com>
 <alpine.DEB.2.21.2003070104380.26274@digraph.polyomino.org.uk>
 <bb8fb713-1adc-38dc-6f0a-1bacacd4f4e1@synopsys.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-07.mgc.mentorg.com (139.181.222.7) To
 svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200306_172918_968363_1B21F6B6 
X-CRM114-Status: UNSURE (   5.36  )
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
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Sat, 7 Mar 2020, Vineet Gupta wrote:

> On 3/6/20 5:08 PM, Joseph Myers wrote:
> 
> > "normal" means "the versions documented in install.texi, node Tools for 
> > Compilation, as the minimum for building glibc on most architectures".
> > 
> > That node should give comprehensive information on what tool versions are 
> > needed to build glibc.  If an architecture requires GCC more recent than 
> > 6.2, or binutils more recent than 2.25, that needs to be documented there 
> > (unless the minimum versions for that architecture are the minimum 
> > binutils / GCC versions that supported that architecture at all).
> 
> Something along the lines...

Yes, that sort of thing.  For a while there was a higher version required 
for powerpc64le, and there will be again soon, so that's an example.

-- 
Joseph S. Myers
joseph@codesourcery.com

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
