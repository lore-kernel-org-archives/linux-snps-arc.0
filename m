Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B21C67861
	for <linux-snps-arc@archiver.kernel.org>; Tue,  9 Apr 2024 08:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=o5ieGCfJqpwaze8RzxQUfzsEZ8VvIwA+KH5O77UzRek=; b=pTmKvPpt/tkCS5
	MhxJlT+wGdMxz9K5C1SVWCyt4Y6MjBqwG1vVPESNFiKDHUXllD2RufzHaBQMhseU9/padnLAHWWWn
	NZcPcjeglxq7t63aA8yXbYD5CSMoHmkui9DqYtGeed1k2pliKgH8PRJLVIi/4qK98E7t+RINUYIAl
	H1eNWd7U9FEgSerlbhdEFswWNUDzX7c6NvaArjl3GmanCfS8yo6J7q4rfYhKbdxoxRuLeBY014gQQ
	6f/DO2hmUy/F7MjKMJjILNiL49BA9TR3yPnxb6JbzAJoqwlp7wKloNyHKMPGXiq/bSRqBtUnFFmQH
	QTqBi30WvStEIzQ5hB3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru6wu-000000010hK-3GYG;
	Tue, 09 Apr 2024 08:35:24 +0000
Received: from mail.haughton.pl ([195.231.81.188])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru6wf-000000010ar-0Zkv
	for linux-snps-arc@lists.infradead.org;
	Tue, 09 Apr 2024 08:35:22 +0000
Received: by mail.haughton.pl (Postfix, from userid 1002)
	id E53A082DFF; Tue,  9 Apr 2024 09:36:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=haughton.pl; s=mail;
	t=1712648180; bh=+oYP7ZwnEeonL1pLtE73TJ85xaesKIG0Ys99vCW5hiU=;
	h=Date:From:To:Subject:From;
	b=IR96cekdfRpOVW8mA2kEDVHa4ChTGv/+G6K3m/1c+fck6lypLPQm4ok7FiY/UMLFt
	 2YMA8+Qn6ClbOi34GYzO0KBDwvORcbq11gNz7VefyGawyZJS+AJuUeOodOvXCXjqDO
	 92sEm1mzuFw4WjhHwCGZ56K8PtVZbFWYQ07WqUdS/Lzt4nzXY4HzNbZjvu+eDQwnj2
	 l5HQOZwY/G2M3OxCY3GVLF3ygmkJU9TDqvX0XpBxcKzAA8vkDuo4BwMu5eQlkeuaXY
	 nL03M/qYt4mnM11ub0xZlEwpXhmUVJHw96WXfoCIK7L/Qzq+OAw3aYhxjZOqzDZe7k
	 YM3q/zZv8aBTg==
Received: by mail.haughton.pl for <linux-snps-arc@lists.infradead.org>; Tue,  9 Apr 2024 07:35:50 GMT
Message-ID: <20240409084500-0.1.1i.ix6i.0.h6dh79nijm@haughton.pl>
Date: Tue,  9 Apr 2024 07:35:50 GMT
From: "Patryk Wysocki" <patryk.wysocki@haughton.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: Zapytanie ofertowe 
X-Mailer: mail.haughton.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_013509_586844_0D9D6ECB 
X-CRM114-Status: UNSURE (   0.09  )
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
