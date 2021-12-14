Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 693A6C433F5
	for <linux-snps-arc@archiver.kernel.org>; Tue, 14 Dec 2021 08:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0uufvMotCcyTKiW2YnHpUsED4Q619vhEfu77SOzIdJU=; b=RJBPIAZhOXEtvX
	XWSaFK2MMM2XNglXz2Vj1dGkZW92WQXcvOfBeoT6r0Jw020sLjQXeAuQtn10qUzgX70F1VRQsgcb8
	WEWm5+cWexykNpEvhjH3eqYGbxRL93d7cPrp8Vz+YOymf0gy7uXOWfXf6Kbcb6TnDM3/Q+8VQfEoL
	K4OMEp4yvGHl32JZ134W+VaI6OUjxWWeGL66V6AGwnvtzz2X5JIO3yBWkg3Da35vrx0V1bodlVnV2
	JkquPYNFUCL0gJfcVZ8xTBBfbqq78ziRCVEjUB8yL/Ywc3l5paamKwGyINfgYM6SeW1//vj+LutDE
	sPCap7G8bRvX4zV4yKBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mx3F2-00D2Ne-MN; Tue, 14 Dec 2021 08:32:56 +0000
Received: from mail.thebizzie.pl ([192.236.147.111])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mx3F0-00D2L1-3h
 for linux-snps-arc@lists.infradead.org; Tue, 14 Dec 2021 08:32:55 +0000
Received: by mail.thebizzie.pl (Postfix, from userid 1002)
 id B1DB31811A1; Tue, 14 Dec 2021 08:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=thebizzie.pl; s=mail;
 t=1639470764; bh=kU+//Lu71IqgcFfjayWXuIc0mZtoyrYJc2YuqyU8eS8=;
 h=Date:From:To:Subject:From;
 b=UhGKAe0/BcLgvzmFjyrqPlzsDobdn6v/6DV0rr9lIQGu3nnqNN86KypQNCIOTRhn+
 pVCQBACVy6+ULha31MDbObi32VZjXpJLancH0ZwjuMFLs0B9EJX1t3ucWoXIV9iaLi
 /ELiA7lEqxCnwkw73TI0Q/CL8tRpXaknWg3nv2HIaEo2rjLsmua6+ZAh2BJDy0ovz1
 zi7632p3n+Y6HmOTRFdBTIq3TP6Ynpd1zQ+9dRy/pQwBBxxatZuyt8l9ZRvTPkNxtI
 Qf5S6imLXIqoINWTOWYjCdLkTBrnf9qxLQduGob3WL1b0cXFIpsy8qFZvMhMF8jj8Z
 DMf/XG8s6kwRA==
Received: by mail.thebizzie.pl for <linux-snps-arc@lists.infradead.org>;
 Tue, 14 Dec 2021 08:31:44 GMT
Message-ID: <20211214074500-0.1.7.1pv.0.9ef94aggxo@thebizzie.pl>
Date: Tue, 14 Dec 2021 08:31:44 GMT
From: "Mateusz Adamczyk" <mateusz.adamczyk@thebizzie.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: Wycena paneli fotowoltaicznych
X-Mailer: mail.thebizzie.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_003254_355326_771F4017 
X-CRM114-Status: UNSURE (   1.13  )
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

RHppZcWEIGRvYnJ5LAoKZG9zdHJ6ZWdhbSBtb8W8bGl3b8WbxIcgd3Nww7PFgnByYWN5IHogUGHF
hHN0d2EgZmlybcSFLgoKxZp3aWFkY3p5bXkga29tcGxla3Nvd8SFIG9ic8WCdWfEmSBpbndlc3R5
Y2ppIHcgZm90b3dvbHRhaWvEmSwga3TDs3JhIG9ibmnFvGEga29zenR5IGVuZXJnaWkgZWxla3Ry
eWN6bmVqIG5hd2V0IG8gOTAlLgoKQ3p5IHPEhSBQYcWEc3R3byB6YWludGVyZXNvd2FuaSB3ZXJ5
ZmlrYWNqxIUgd3N0xJlwbnljaCBwcm9wb3p5Y2ppPwoKClBvemRyYXdpYW0sCk1hdGV1c3ogQWRh
bWN6eWsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25w
cy1hcmMK
