Return-Path: <SRS0=aZIh=55=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 809FDC2BA2B
	for <linux-snps-arc@archiver.kernel.org>; Mon, 13 Apr 2020 21:11:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 448EF206DA
	for <linux-snps-arc@archiver.kernel.org>; Mon, 13 Apr 2020 21:11:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GPNJ6euV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="NBNoHiB1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="QSFWtUDe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 448EF206DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=otdTnayTazenD4C7cCzepAB0fiCQUE5a//1qRB/3u2o=; b=GPNJ6euVxctCC+
	rlR+PiCRV1aYpUNnxH8BASTkfCX6jL4J0WB0qkeHov2m/YklVCkeg4T8O+dVhc3beGxD58oOyefAy
	PtShSZtoKTEvd8OfcSSUg01KOYpwybjUtbC5yy9julhjl3U71EH2oc23UWsSNu264aYiE+lviXwqf
	Nvb+GFeb+L9g0XdU7Wdv1y1MB5Jsq+8BgWqre2iyKlFYKt8jh53ARFyX2h41IuUrgutCjnrQgYnPd
	XzQLOlESUksROn5tDqeNyW311xNC87ay7p05qoEH6Ev6rUlnhIVENrCiAVbDXthsEG6vmE7WlPgbr
	BhhVP49VhWbFbSa5DxYw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jO6Mt-000756-MB; Mon, 13 Apr 2020 21:11:47 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jO6Mq-00074d-Nz
 for linux-snps-arc@lists.infradead.org; Mon, 13 Apr 2020 21:11:46 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 69C8D4006E;
 Mon, 13 Apr 2020 21:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1586812302; bh=o1J8d0C+btLMLNOzJYfOF26LpSjsOUoU6FDTrZv7qbw=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=NBNoHiB1C9P8SmyhCkcBVJArZytUYszAjn6yFB3V+GWR2RVVUXO16arm5//GSqDct
 751ZDtNgQpmwqsBpr18OM9uFvvO2g1gejsfosU4vaa7B9/1Er4WumekG7U3tonVOSF
 LurHMHeaAA2jgin1GpegoGZEYIUK739urJMUs2e+exUedFhicayAAh8VwsCD9m6tQY
 vslTC2Ze9PfBH70YQOnlOwQrtBMvdhEGsdW7uw+YhE7cIfmiBbUTbJlXBMSp4XIVUm
 Gjvng+WGiKTi13skJK32YePlUQO7iR0CLR+HUnYsArbuL0PrkgzTyooSHFXB+3CVEQ
 Kmjb+61gYrsmQ==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 0E43BA0067;
 Mon, 13 Apr 2020 21:11:34 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 13 Apr 2020 14:11:34 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 13 Apr 2020 14:11:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jRpNRZ8m8uoM+OeyQ0tMLVUHodzOUE8kvM8ctpb1pwIr9K9ourPhldJWmRV2OD/oZaGew3MDZYvBmRAfNRHjifIFzjq3ZRDpVSzlKaMH2cYNf6924wgydxjgvzFgXYBDSkOt3nqJWI5rzcyzfzC5VuUBG6IJwH7ITvP6+MW+jAlSiY8VqWpxRL7YLpfjQ6kMq6JVtYbZ3dH6SKrBIRjsIGJmztZCar8XyINjAUabZQ8gXmzcw/Sijespsxk0xZzX25LSPHv2ZJ+DIC8aVwnH8OVDx1+OWwHrr3N3P8colF9ZzszczZtzWdZQWvo1836eE8s+oddqbr6kEViBrbYyvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o1J8d0C+btLMLNOzJYfOF26LpSjsOUoU6FDTrZv7qbw=;
 b=Z2ViZt8k/VDN9Ol6Fexhdzx5eu9mmrNlPhLAExq6F6o76CsMhVB6cC5gWPM1cLj8MR4SQqfW7MFC0ZedyssDYS21fZGTA2sCBYgPnvd6kOw6LfyhKj8RAThrNsBVC6FLE9Djsf9Z81/9TBJkVD7I7bY+luVuAg5++KRZOE7y8Xmqf/qdt17rBEwHQx3HPTxrZZ1wizkGM/AQ0J8cT1heCWjh2z9+ZOxQjVic5QzYIl/SU3ybcK5gozCnJ1kuuLDoSbtRO8WKZDQwdiD0r1w1pfPS6rE/fxuFE8OkOPADV3BGIpQzzqisKZUuohz11NFASB90RzJ+2Ne9rZcqQDl8lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o1J8d0C+btLMLNOzJYfOF26LpSjsOUoU6FDTrZv7qbw=;
 b=QSFWtUDeeY/pOXLCvOJWn1a9KzzGt4ylEAIDeXffWfDzX1hDAhX0nAY/eQ8ziorCr/jPfYUhMuv5SaqhA4mCUtuaoCYTZ3FUQsQgl4mufE/qgvQPEcaRGOZjfArH3Bgdz1K8K3XzpzGcd9lBo/K8UzxKgDW2s21zyCcYIgwzj7U=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25)
 by BYAPR12MB3351.namprd12.prod.outlook.com (2603:10b6:a03:de::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.26; Mon, 13 Apr
 2020 21:11:32 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7%7]) with mapi id 15.20.2900.028; Mon, 13 Apr 2020
 21:11:32 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Subject: Re: [PATCH v2] provide y2038 safe socket constants for
 default/asm-generic ABI
Thread-Topic: [PATCH v2] provide y2038 safe socket constants for
 default/asm-generic ABI
Thread-Index: AQHWB6PqYTbfA7IijUqRmITzYdB8aKhseoAAgAsmbYA=
Date: Mon, 13 Apr 2020 21:11:32 +0000
Message-ID: <b202e628-be48-3490-2fbe-f0ec8fa079cc@synopsys.com>
References: <alpine.DEB.2.21.2003312122350.30236@digraph.polyomino.org.uk>
 <20200331213208.22543-1-vgupta@synopsys.com>
 <7ba99a07-381e-af29-e0d7-4484e25dbcac@synopsys.com>
In-Reply-To: <7ba99a07-381e-af29-e0d7-4484e25dbcac@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vgupta@synopsys.com; 
x-originating-ip: [2601:641:c100:83a0:7c06:2fd:ae14:dd9]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 36643f15-590e-4e8a-d1fa-08d7dfef3dd4
x-ms-traffictypediagnostic: BYAPR12MB3351:
x-microsoft-antispam-prvs: <BYAPR12MB33513D36003022F64C8CAF01B6DD0@BYAPR12MB3351.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:264;
x-forefront-prvs: 037291602B
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3592.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(366004)(39860400002)(136003)(346002)(376002)(396003)(81156014)(31696002)(31686004)(5660300002)(86362001)(8936002)(6916009)(4326008)(186003)(6486002)(71200400001)(8676002)(2616005)(54906003)(478600001)(76116006)(36756003)(66946007)(66446008)(64756008)(53546011)(66556008)(2906002)(6506007)(316002)(66476007)(6512007)(41533002);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3gW4dehi0Lw6+snjHTCB6mvAX0juTlux0r/CJgwh2Izcn5SSua5zHTxTWv4ZJDSs0utXqaTf+uoeUy7WOQM3PG0HxoN4IQKYw17ugGvxeG94+AU3ZOe57gsIa+XDuSGLi2lL5L8Hal5O+xeJLt5z1AcXnTk7islWvdleMj6hd5Hrz4nD1eiE7xhylLz9ob1aUsoiOPF+dCkGwkZ9jYrnd17BSaNLXBWcHG61+Ld2/WmKoO/Y6hByPm+902aEKKLeNiuAxg7vMVDVQTAQa03gRCRk2Wi02vFGZhPxJ0JHwimD7VXI+VdWJ15TSj6bZECugoxqwO50U6SNlvNTqur/GkE/d4uJUlK8ht7pSbUNj/Qee1p9oZMNSvN//8bxg6njysHlYc8A+EN+9CJLxcHBQEh92+zEKf5fInk/GMXhneqA2lpkDb4+Faal7/xgpQxr7X3HfqampHSDFhaeYetudhb5qwC1bJ1ftMCnRLbuVMFmO/WbBo3zslFrH3MeUotZ
x-ms-exchange-antispam-messagedata: bQ6K3jwlOhYl2qP4ThnqPjN03qrjro2PMigSGBofhJGOdGnsGI+HrnmpbZb4zAq6RRbEurlGDHxp2RTibTXxk9tjA4f4P6r1Idhg9Sv2a56Ec3UrJ4jwAklQrOAVtnmLdoVbuZDX3aKWmd5uamX62aB2hqJdRBKu999Vt74RxXej0SAVxYt8ft7ODT5opyhlMqduTqnPqeY094qrV2f61A==
x-ms-exchange-transport-forked: True
Content-ID: <119CA38C39C01C4FA10F365A3D387022@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 36643f15-590e-4e8a-d1fa-08d7dfef3dd4
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2020 21:11:32.1581 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I2kXYQ61JJpwCngy+1uhq1X71JF9Gb+umcqacHndAswoagyPjDp2JAaHn3ry96FLnFopa8uQ/Q4bAIB/YuIhcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3351
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200413_141144_818488_C9C5D83E 
X-CRM114-Status: GOOD (  12.33  )
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
Cc: Stepan Golosunov <stepan@golosunov.pp.ru>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 4/6/20 11:55 AM, Vineet Gupta via Libc-alpha wrote:
> On 3/31/20 2:32 PM, Vineet Gupta via Libc-alpha wrote:
>> These will be used by upcoming RV32 and ARC ports and any future ports.
>>
>> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
> 
> ping !

ping ^2 !

> 
>> ---
>> This is a straight copy of code originally written by Alistair, hence
>> adding his SOB as well
>> ---
>>  sysdeps/unix/sysv/linux/bits/socket-constants.h | 16 ++++++++++++++--
>>  1 file changed, 14 insertions(+), 2 deletions(-)
>>
>> diff --git a/sysdeps/unix/sysv/linux/bits/socket-constants.h b/sysdeps/unix/sysv/linux/bits/socket-constants.h
>> index 9dcc19cd5380..d02e1cbc7cf1 100644
>> --- a/sysdeps/unix/sysv/linux/bits/socket-constants.h
>> +++ b/sysdeps/unix/sysv/linux/bits/socket-constants.h
>> @@ -20,6 +20,8 @@
>>  # error "Never include <bits/socket-constants.h> directly; use <sys/socket.h> instead."
>>  #endif
>>  
>> +#include <bits/timesize.h>
>> +
>>  #define SOL_SOCKET 1
>>  #define SO_ACCEPTCONN 30
>>  #define SO_BROADCAST 6
>> @@ -30,9 +32,19 @@
>>  #define SO_OOBINLINE 10
>>  #define SO_RCVBUF 8
>>  #define SO_RCVLOWAT 18
>> -#define SO_RCVTIMEO 20
>> +#if (__TIMESIZE == 64 && __WORDSIZE == 32 \
>> +     && (!defined __SYSCALL_WORDSIZE || __SYSCALL_WORDSIZE == 32))
>> +# define SO_RCVTIMEO 66
>> +#else
>> +# define SO_RCVTIMEO 20
>> +#endif
>>  #define SO_REUSEADDR 2
>>  #define SO_SNDBUF 7
>>  #define SO_SNDLOWAT 19
>> -#define SO_SNDTIMEO 21
>> +#if (__TIMESIZE == 64 && __WORDSIZE == 32 \
>> +     && (!defined __SYSCALL_WORDSIZE || __SYSCALL_WORDSIZE == 32))
>> +# define SO_SNDTIMEO 67
>> +#else
>> +# define SO_SNDTIMEO 21
>> +#endif
>>  #define SO_TYPE 3
>>
> 

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
