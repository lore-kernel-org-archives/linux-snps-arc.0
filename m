From: edumazet@google.com (Eric Dumazet)
Date: Wed, 29 Mar 2017 14:41:40 -0700
Subject: [PATCH] ezchip: nps_enet: check if napi has been completed
In-Reply-To: <20170329.143014.2001816338079751776.davem@davemloft.net>
References: <1490784106-14489-1-git-send-email-vzakhar@synopsys.com>
 <20170329.143014.2001816338079751776.davem@davemloft.net>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CANn89iJ1+7CrF=hJj-_pLWV+EDXxhUZGOL+3je6zjE8dJDcr=A@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Wed, Mar 29, 2017@2:30 PM, David Miller <davem@davemloft.net> wrote:
Signed-off-by: Vlad Zakharov <vzakhar at synopsys.com>
>
> Applied.
>
> Eric, if this is really required now, we have 148 broken drivers still.

Piece of cake :/

If we get more reports like that, we might implement a logic to
prevent infinite loops.

It is not clear to me what exactly happened to this driver, since
testing napi_complete_done() was not mandatory.
