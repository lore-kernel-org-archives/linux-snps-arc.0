Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B1FBEE57EC
	for <linux-snps-arc@archiver.kernel.org>; Wed, 31 Dec 2025 08:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=D0D1wSJt4a+BWcjl+KTIPa9r3kax+A+MdYvrsoe5kN0=; b=aLbqK6qURw7048
	7n96RLKJyUSKTFQkHmPXgCqiTOE77XXsKN4a0ksLTfaQLjc1geapMCJdscNbdSuOIGmv7aaruegdz
	TDkXK7qwwB+K0QEaO2TwQyn1GRuu4xLu4GLdNcZOLpLtcOOj5uF27aTAZQI5kpSArG91uzCaf9Bz/
	JV/5gW9EgLgHkO/QkW52m6VAw4r5jlcgLrh46PPRldOpVokhl7Jt3H29kxLYxJfbf0rMW85c36mBM
	SmylA09vUam20WE0VGZsUXynwwhshntFxA4De5ct8n+qYamkHl8V9T7cHOymn+2SnDlBvsvMXBH4Q
	f17YVWjWIdsP6ZIog+bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1varmC-00000005ndg-0US4;
	Wed, 31 Dec 2025 08:41:52 +0000
Received: from mail.corpiza.com ([94.177.230.79])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1varm9-00000005ndI-30Bx
	for linux-snps-arc@lists.infradead.org;
	Wed, 31 Dec 2025 08:41:51 +0000
Received: by mail.corpiza.com (Postfix, from userid 1002)
	id 3C24483A0D; Wed, 31 Dec 2025 09:40:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=corpiza.com; s=mail;
	t=1767170495; bh=IbibiN3Lkpo70lH78L2CAhrcVfhS7UddvlUI33agIVg=;
	h=Date:From:To:Subject:From;
	b=XTYVFktpUaxbkcKb6BzuD1NHuwEdTZ/7scbcpKWAEGUVRQqzZe+EPAMqtraEs0lZO
	 J9fJHAf+FRl9o7h7XfEefqZbWSsA8LbGA1VxOByivN2x1AjsPzYrfLAp/l4i6qVW1J
	 FTcfYT8gmBqwntsUdUCGnUTY0a7qRZq8lXq0LzRtwaSfFZ53M6gBcJxywG1mYASTII
	 bYwdPpp+SPVuQtvPXsoCUqHZX0Q9L0f0ZDsNnJeH4oCb/JRf7eef93sowLkxfUuhyo
	 CJNsodCocJtl4HV3vT0nWcF1A9Qi8F+Oh/8uRutb3ru+B0dzR9YPpALZp+BTSF38uH
	 OVvuWWseGE/BA==
Received: by mail.corpiza.com for <linux-snps-arc@lists.infradead.org>; Wed, 31 Dec 2025 08:40:18 GMT
Message-ID: <20251231084500-0.1.af.155dv.0.iex98lr4k9@corpiza.com>
Date: Wed, 31 Dec 2025 08:40:18 GMT
From: =?UTF-8?Q?"Piotr_Kami=C5=84ski"?= <piotr.kaminski@corpiza.com>
To: <linux-snps-arc@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.corpiza.com
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_004150_198412_A1E21225 
X-CRM114-Status: UNSURE (   0.68  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

RHppZcWEIGRvYnJ5LAoKQ3p5IGplc3QgbW/FvGxpd2/Fm8SHIG5hd2nEhXphbmlhIHdzcMOzxYJw
cmFjeSB6IFBhxYRzdHdlbT8KClogY2jEmWNpxIUgcG9yb3ptYXdpYW0geiBvc29ixIUgemFqbXVq
xIVjxIUgc2nEmSBkemlhxYJhbmlhbWkgendpxIV6YW55bWkgemUgc3ByemVkYcW8xIUuCgpQb21h
Z2FteSBza3V0ZWN6bmllIHBvenlza2l3YcSHIG5vd3ljaCBrbGllbnTDs3cuCgpaYXByYXN6YW0g
ZG8ga29udGFrdHUuCgoKUG96ZHJhd2lhbQpQaW90ciBLYW1pxYRza2kKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcg
bGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
