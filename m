Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC6AE77183
	for <linux-snps-arc@archiver.kernel.org>; Mon, 16 Dec 2024 09:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=o5ieGCfJqpwaze8RzxQUfzsEZ8VvIwA+KH5O77UzRek=; b=SEWZJB4JGqtpb5
	8nOEjfY9WSr1rene5YXGx7k8pdvMyn48MrqM5bRI4Agw76V9DHSjOwcB6FdStWaEL2MA7J42pKzw6
	Udwxwvnx92Vhet0EBm8JcG2KN2YZ/JxPEZfvuN2avtuiiZ61ctKab4P/vyQIQS9eet0QoexquWG2+
	n5rc+TL+7IEs+DaTt7L5M804SRvFKvxgulLpFYSNMMknLnxO/r24ikRC+s8DXqYTdDYyFnFG89GNu
	IkmOTgKds+iso+/iRYXgn+Fv4Fe0tZC1SgQZYGM5XJ9b7h3ARIdF+aXvalonsk28cE+hV9V9v6RSa
	/WunW547wVwqma9YaGWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN70E-00000009U5X-0u1o;
	Mon, 16 Dec 2024 09:02:58 +0000
Received: from mail.analyticsservices.pl ([217.61.0.186])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN6xx-00000009Thp-0gyB
	for linux-snps-arc@lists.infradead.org;
	Mon, 16 Dec 2024 09:00:38 +0000
Received: by mail.analyticsservices.pl (Postfix, from userid 1002)
	id 7839B84054; Mon, 16 Dec 2024 09:57:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=analyticsservices.pl;
	s=mail; t=1734339450;
	bh=+oYP7ZwnEeonL1pLtE73TJ85xaesKIG0Ys99vCW5hiU=;
	h=Date:From:To:Subject:From;
	b=KWzXhOOV6ojlqVxWW21FNT26rxq8UXDdpP05MdE3lkcrNQmMzkhXpglaURyRs/m/b
	 OabMma4lgQBjW3JjIMM4yNTDxl8MFBG7iCOjWaTXj9uiaV6CFG309vG81Km/SuPXRe
	 u3BodcAU/7tMh8aHqnJEIF7ZYX3fSZE7CoaKUT/3cTlWwJE3E+C/BAXKTytqfJZgzp
	 IVh98Jysn1j9HxfnDsqwu2n8FMrpr8J0EHm5OwFUSDt+hD+2fyaLvmMRbBEKzqSYtW
	 XM+1OZNfoT2PvZswv0/h7Q/G/kRsRXO6CTW1rGNbRrT+zttOTEEk56CuCfNNMFFTPs
	 amPG2VW/gkogg==
Received: by mail.analyticsservices.pl for <linux-snps-arc@lists.infradead.org>; Mon, 16 Dec 2024 08:56:01 GMT
Message-ID: <20241216084501-0.1.i.3mu1.0.s7qin6pdai@analyticsservices.pl>
Date: Mon, 16 Dec 2024 08:56:01 GMT
From: "Patryk Wysocki" <patryk.wysocki@analyticsservices.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: Zapytanie ofertowe 
X-Mailer: mail.analyticsservices.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_010037_337045_DEFC610B 
X-CRM114-Status: UNSURE (   1.10  )
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

RHppZcWEIGRvYnJ5LAoKUG96d29sacWCZW0gc29iaWUgbmEga29udGFrdCwgcG9uaWV3YcW8IGpl
c3RlbSB6YWludGVyZXNvd2FueSB3ZXJ5ZmlrYWNqxIUgbW/FvGxpd2/Fm2NpIG5hd2nEhXphbmlh
IHdzcMOzxYJwcmFjeS4KCldzcGllcmFteSBmaXJteSB3IHBvenlza2l3YW5pdSBub3d5Y2gga2xp
ZW50w7N3IGJpem5lc293eWNoLgoKQ3p5IG1vxbxlbXkgcG9yb3ptYXdpYcSHIHcgY2VsdSBwcnpl
ZHN0YXdpZW5pYSBzemN6ZWfDs8WCb3d5Y2ggaW5mb3JtYWNqaT8gCgoKUG96ZHJhd2lhbQpQYXRy
eWsgV3lzb2NraQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1zbnBzLWFyYwo=
