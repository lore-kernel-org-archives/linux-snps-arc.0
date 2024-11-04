Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F303BD132A2
	for <linux-snps-arc@archiver.kernel.org>; Mon,  4 Nov 2024 10:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:To:
	Message-ID:From:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0bvLD/zxPXX3ZD569x+/g1vJQ9PA33TIHPrEB43kPkA=; b=gtsyZtIeeIxEl7
	J4qDo8bXO8QQY7HC3QqKmIPNcBUqVIUckMNzi5NpSqBJnQayQnIteXx9gwJBi/NFEvaZ0xAKywlUI
	Rfw2MgQgIOlLXjlOUX5wIX0Vyl6qdURkWwjRoycXKG4FCSNTI5LKjFL4YZa+fdN0bY2JTHgP/RIMe
	LKMGgEJSj0iUXkrK+yQlX7CeAksTeBl2ouYXiNpr+xB89NSh/f1URUuJakYzQqlTiJO0b/AYPrgjf
	7TVXWVxIaLIH6byeeN+7+AmN1G0NAK1qaITQzeBMhtMoGTNkfE6F0zWYG1NrpctOhDUK+m6alkt3H
	7p4EvDkqtB42ujnnuj2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7u6n-0000000DHeY-2r8B;
	Mon, 04 Nov 2024 10:14:53 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7tyW-0000000DFv9-4BXu
	for linux-snps-arc@lists.infradead.org;
	Mon, 04 Nov 2024 10:06:22 +0000
Received: by mail-pg1-x544.google.com with SMTP id 41be03b00d2f7-7ea9739647bso2812681a12.0
        for <linux-snps-arc@lists.infradead.org>; Mon, 04 Nov 2024 02:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730714779; x=1731319579; darn=lists.infradead.org;
        h=mime-version:date:subject:to:reply-to:message-id:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BX28rAzmD4iiFzVyOHBt728GRE15tu8MjCYp4yUF6Zs=;
        b=jKkYcstnzBAoTcnhnqIfZjqSD9/zhgOiLcx8iTA+L3TXJzH8WuuOOrbZqh+giUJQZj
         o9YbLgvtKu16Y7ESQwGt4Y1N6NV7PdgFMpxZYv/yip/b+Sw+CPRtB4A/kBnn1rAQHLcO
         kj+EjSFFzLq3LFyMFhbPe2oppAiQkvCA4muK6Ix0VtueGob3QNS4BUWU40KAcqbAVJ8W
         lAkdCC5OHfaXnqS70Fn8bfzMgiVbXO/skYmGIIqRrWyYrELHK/GB+O+PeXE00ZUG2+H6
         dPXSvl0F/SAxXZ3qh2VxXA0O1sNyBMiGQdpIetmsD1omZawOrWSbhkNIAtJ1BMfehXRC
         QFSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730714779; x=1731319579;
        h=mime-version:date:subject:to:reply-to:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BX28rAzmD4iiFzVyOHBt728GRE15tu8MjCYp4yUF6Zs=;
        b=VgxC4EZLH+MBx8GRjmH4LAnU1ZH17yGSxmuXYzEIAZzucyI8YwAVvm0Ov7zEfgxUdQ
         frCZjSdlBEic6Z+KDN5V93DR09VnSWJo8x9uyUfbKd+hDS1g7/yBxe1PIHuzlEmr/gyn
         50und6Q/nUvbKp0UCUI0T9sxiFlrZX8NPwfjQJZ+j+2+PJUcPJ3+BtxBClinbewOCjfI
         jCeg+61pd25B1/Tc4uAOAnRTn8V+99qWOXb0Nq3CxA3CVU97ejB6mEOrwvJuPNUYIzhG
         WTiZxxG111ZQKWV1rZl0vMz8O2JFu7zbmU0R7UBk+5gqQfKGQ47pupQPY2wFgG9Ra37n
         3j5g==
X-Gm-Message-State: AOJu0Yz+1K/Oicl9GIvkFpfQFbLHEUp/wAGFKpzEH03UmGYVuCVvf077
	P99a/n1JUZcKh5uqT1t/jpa2vXs61e1zm2WLJzPQSHoCC7GWMgJwjbhVLhVa
X-Google-Smtp-Source: AGHT+IF4IJvmXXy2kXdp7q8Q4699cBc1qzZGQfJEDrvdtFqUF7hKonvfM/3a6wJ0VWjDQhwWzKaugQ==
X-Received: by 2002:a17:902:e80b:b0:20c:c01d:54a8 with SMTP id d9443c01a7336-210c689ab26mr422794795ad.16.1730714779415;
        Mon, 04 Nov 2024 02:06:19 -0800 (PST)
Received: from [103.67.163.162] ([103.67.163.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211056efd71sm57638525ad.4.2024.11.04.02.06.18
        for <linux-snps-arc@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 Nov 2024 02:06:18 -0800 (PST)
From: Debbie Magoffin <ariful652041@gmail.com>
X-Google-Original-From: Debbie Magoffin <dmagoffin@outlook.com>
Message-ID: <a9fa3fe6a49e2c63dc804e07cb26d461a96f24d43d42f3f4511151e4e8e977ce@mx.google.com>
To: linux-snps-arc@lists.infradead.org
Subject: Yamaha Piano !!
Date: Mon, 04 Nov 2024 05:06:09 -0500
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_020621_040327_66C33477 
X-CRM114-Status: UNSURE (   2.37  )
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
Reply-To: dmagoffin@outlook.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hello,

I am offering my late husband?s Yamaha piano to anyone who would truly appreciate it. If you or someone you know would be interested in receiving this instrument for free, please do not hesitate to contact me.

Warm regards,
Debbie

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
