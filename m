Return-Path: <SRS0=jMyS=7P=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 432C0C433E0
	for <linux-snps-arc@archiver.kernel.org>; Tue,  2 Jun 2020 18:13:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13E372068D
	for <linux-snps-arc@archiver.kernel.org>; Tue,  2 Jun 2020 18:13:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kI/akPNK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13E372068D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codesourcery.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Iu8GohqInCgNrT01G+iuAxGVyDWQTb2xAh2rTu5sdDs=; b=kI/akPNKzSpxWH
	4U+vANWIegvXk7M9N9W/O+edRajowJCT4jJ4Po5v848nclC8p6omH71GRI4s1Mzn+49kLRrjL8RaO
	EVqQmZ3IKGScTFqZxgvtpRnxcSMbJRRDdY8W5nNqKwn/iCkxtkJ3c9P7HA+F9O/IeIdZ0gxBfqGwv
	HMmNZvtjCm3XbEN3acFVsygwJ1Elf9pjlYSnuWLDq2GGK6Y2JdOWzxMGrbG50mgTNSKcAS8pguGmj
	Ga6kbejAt/Tr96A6Dqm+uNAJveMLxKMHo9LKBW5qtBojNAvnPVl8QSbMRe5xhozG/6AFFuOEGWQlt
	VOS1kZBGqQvtmM0mjfCA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgBPy-0001cl-7f; Tue, 02 Jun 2020 18:13:42 +0000
Received: from esa2.mentor.iphmx.com ([68.232.141.98])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgBPw-0001cT-LO
 for linux-snps-arc@lists.infradead.org; Tue, 02 Jun 2020 18:13:41 +0000
IronPort-SDR: /af7OBKAeP3q78PKKY299okr4elJkz/M83+DtXDoStbPU/POJ7LEmvR5DKucbs0b/XvoPSaFQu
 /Wprcq9LDHRhe7FF9JLiDPDh/MOqHZa8DBhaA3ATDc5csKA0h/6ychCNywldgIKKASdtm0+8+m
 drL0H56Gw6vzDv525oeWi4HDOnKToxXGzC53SfXyaobO0H7YXugMOnmd6oIF8ZPo18zoPm4nBs
 9QSYw++7SJH9AIZg4h2w7T6+SGSaFlPVuC56HmcetkHF3gNO3JBlI/2lIy29DPhS6V7lzuM06z
 EXg=
X-IronPort-AV: E=Sophos;i="5.73,465,1583222400"; d="scan'208";a="49388419"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
 by esa2.mentor.iphmx.com with ESMTP; 02 Jun 2020 10:13:40 -0800
IronPort-SDR: zuDx7trGcaX/N/SQi4sG3juEemauNadP6Z0Fxjhp/1JICujcjSbJChdyfPOkeQ5F42qi6HLa2q
 A2vUbmkQTcsU3jeXn73eAMHJVLqo6YKqkWGj3E9qGFfWrs95sDjEFhHPNwjctnxCdeXZYkkNzW
 wvqXgXL6RYHZ6z8u+Y/vuEEH9VA8IVG7aJGVvRof3PSpJov063CCLu/UQZdw7yMkayrRQ8VBL0
 IXzNsgbCTJaJk5DqHZXRU5mJb6ZdCkrcaeUvRr+RWFTZQUDsFtZ7qeohrodp+MA/Nih/X05sCD
 mDE=
Date: Tue, 2 Jun 2020 18:13:34 +0000
From: Joseph Myers <joseph@codesourcery.com>
X-X-Sender: jsm28@digraph.polyomino.org.uk
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: static inline math functions (was Re: [PATCH v6 06/13] ARC:
 hardware floating point support)
In-Reply-To: <07887c48-7e07-9f89-035d-3f336a16f2da@synopsys.com>
Message-ID: <alpine.DEB.2.21.2006021812590.3673@digraph.polyomino.org.uk>
References: <20200423014126.10417-1-vgupta@synopsys.com>
 <20200423014126.10417-7-vgupta@synopsys.com>
 <de8975a0-bb03-8cec-be97-56f8c4e2a2f3@linaro.org>
 <91c2aba8-bff5-5ddc-7a95-c93c90883150@synopsys.com>
 <5b06914d-acb3-4404-4ff2-93bb7a04f8f5@synopsys.com>
 <07887c48-7e07-9f89-035d-3f336a16f2da@synopsys.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2) To
 svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200602_111340_704427_33A18168 
X-CRM114-Status: UNSURE (   4.12  )
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
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>,
 Adhemerval Zanella <adhemerval.zanella@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Tue, 2 Jun 2020, Vineet Gupta via Libc-alpha wrote:

> Thi s approach seems to trip math/check-installed-headers.out
> 
> 
> :::: -std=c89
> In file included from ../include/fpu_control.h:2,
> from /tmp/cih_test_Nknxdp.c:8:
> ../sysdeps/arc/fpu_control.h:82:14: error: expected ';' before 'unsigned'
> 82 | static inline unsigned int arc_fpu_getcw(void)
> 
> 
> Any tips ?

Installed headers have to use __inline instead of inline to work in C90 
mode.

-- 
Joseph S. Myers
joseph@codesourcery.com

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
